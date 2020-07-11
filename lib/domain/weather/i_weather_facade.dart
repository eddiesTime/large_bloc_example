import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_example/domain/weather/value_objects.dart';
import 'package:flutter_bloc_example/domain/weather/weather_failure.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Is an interface that specifies which methods are relevant to connect to the domain layer.
abstract class IWeatherFacade {
  /// Is an asynchronous method that returns `WeatherResponse` for a given [location].
  Future<Either<WeatherFailure, WeatherResponse>> getWeatherForLocation(
      {@required City city});

  /// Is an asynchonous method that return an updated `WeatherResponse` for a given [location]
  /// by making another request.
  Future<Either<WeatherFailure, WeatherResponse>> refreshWeatherData(
      {@required City city});

  /// Returns a `WeatherCondition` for a given [weather].
  WeatherCondition getWeatherConditionForWeather({@required Weather weather});
}
