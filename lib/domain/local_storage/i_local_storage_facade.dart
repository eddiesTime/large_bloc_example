import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/domain/local_storage/local_storage_failure.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:meta/meta.dart';

/// Is an interface that specifies which methods are relevant to connect to the domain layer.
abstract class ILocalStorageFacade {
  Either<LocalStorageFailure, WeatherEntity> loadWeatherDataFromLocalStorage();
  Future<bool> saveToLocalStorage({@required WeatherEntity weatherEntity});
}
