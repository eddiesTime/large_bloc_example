import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/domain/local_storage/i_local_storage_facade.dart';
import 'package:flutter_bloc_example/domain/local_storage/local_storage_failure.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_bloc_example/infrastructure/weather/weather_entity_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ILocalStorageFacade)
class LocalStorageRepositoryFacade implements ILocalStorageFacade {
  final SharedPreferences _sharedPrefs;

  LocalStorageRepositoryFacade(this._sharedPrefs);

  @override
  Either<LocalStorageFailure, WeatherEntity> loadWeatherDataFromLocalStorage() {
    try {
      final String localStoredData =
          _sharedPrefs.getString('latestWeatherEntity');
      final Map<String, dynamic> localStoredDataJsonMap =
          jsonDecode(localStoredData) as Map<String, dynamic>;
      final WeatherEntityDto _weatherEntityDto =
          WeatherEntityDto.fromJson(localStoredDataJsonMap);

      return right(_weatherEntityDto.toDomain());
    } catch (_) {
      return left(const NoDataStored());
    }

    // return _sharedPrefs.get(weatherEntity.id.getOrElse('weatherEntity'));
  }

  @override
  Future<bool> saveToLocalStorage({WeatherEntity weatherEntity}) {
    final WeatherEntityDto _weatherEntityDto =
        WeatherEntityDto.fromDomain(weatherEntity);
    return _sharedPrefs.setString(
        'latestWeatherEntity', jsonEncode(_weatherEntityDto));
  }
}
