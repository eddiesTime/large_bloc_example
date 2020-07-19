import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:flutter_bloc_example/domain/core/value_object.dart';
import 'package:flutter_bloc_example/domain/weather/value_objects.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Weather State', () {
    test('should check whether the factory constructor is working correctly',
        () {
      final City _city = City('London');
      final WeatherEntity _weatherEntity = WeatherEntity.initial();
      final WeatherState _state = WeatherState(
        city: _city,
        isLoading: false,
        showErrorMessages: false,
        weatherEntity: _weatherEntity,
        weatherFailureOrSuccessOption: none(),
      );
      expect(_state, isA<WeatherState>());
    });
    test(
        'should check whether WeatherState.initial() is returning the correct state',
        () {
      final WeatherState _initial = WeatherState.initial();
      expect(_initial.weatherEntity, isA<WeatherEntity>());
      expect(_initial.weatherEntity.id, isA<UniqueId>());
      expect(_initial.weatherEntity.lastUpdated, none());
      expect(_initial.weatherEntity.weatherResponse, none());
      expect(_initial.city, City(''));
      expect(_initial.showErrorMessages, false);
      expect(_initial.isLoading, false);
      expect(_initial.weatherFailureOrSuccessOption, none());
    });
  });
}
