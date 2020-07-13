import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/domain/weather/i_weather_facade.dart';
import 'package:flutter_bloc_example/domain/weather/value_objects.dart';
import 'package:flutter_bloc_example/domain/weather/weather_failure.dart';
import 'package:flutter_bloc_example/infrastructure/weather/city_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:weather_repository_core/weather_repository_core.dart';

/// Implements the interface `WeatherFacade` provided by the domain layer.
///
/// It takes in a [WeatherRepository] which is used to request weather data.
@LazySingleton(as: IWeatherFacade)
class WeatherRepositoryFacade implements IWeatherFacade {
  final WeatherRepository _weatherRepository;

  WeatherRepositoryFacade(this._weatherRepository);

  @override
  WeatherCondition getWeatherConditionForWeather({Weather weather}) {
    return weather.mapConditionToWeatherCondition(weather.condition);
  }

  @override
  Future<Either<WeatherFailure, WeatherResponse>> getWeatherWithQuery(
      {@required City city}) async {
    try {
      final CityDto cityDto = CityDto.fromDomain(city);
      final WeatherResponse _wr =
          await _weatherRepository.getWeatherWithQuery(city: cityDto.city);
      return right(_wr);
    } catch (e) {
      return left(const NotALocation());
    }
  }

  @override
  Future<Either<WeatherFailure, WeatherResponse>> getWeatherWithLattLong({
    @required double latt,
    @required double long,
  }) async {
    try {
      final WeatherResponse _wr = await _weatherRepository
          .getWeatherWithLattLong(latt: latt, long: long);
      return right(_wr);
    } catch (e) {
      return left(const NoLocationFoundForLattLong());
    }
  }

  @override
  Future<Either<WeatherFailure, WeatherResponse>> refreshWeatherData(
      {@required City city}) async {
    try {
      final CityDto cityDto = CityDto.fromDomain(city);
      final WeatherResponse _wr =
          await _weatherRepository.getWeatherWithQuery(city: cityDto.city);
      return right(_wr);
    } catch (e) {
      return left(const UnableToRefresh());
    }
  }
}
