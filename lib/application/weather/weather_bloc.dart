import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/domain/core/value_object.dart';
import 'package:flutter_bloc_example/domain/weather/i_weather_facade.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_bloc_example/domain/weather/weather_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

/// A business logic component to handle weather related logic in the application.
@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IWeatherFacade _weatherFacade;

  WeatherBloc(this._weatherFacade) : super(const Initial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeather) {
      yield* _mapFetchWeatherToState(event);
    }
    if (event is RefreshWeather) {
      yield* _mapRefreshWeatherToState(event);
    }
  }

  /// Yields [WeatherState.loaded(weatherEntity)] with a newly created [WeatherEntity] when the weather data has been fetched successfully.
  ///
  /// Yields [WeatherState.loadingFailure()] when an error occured while fetchibg the weather data.
  Stream<WeatherState> _mapFetchWeatherToState(FetchWeather event) async* {
    yield const Loading();
    final Either<WeatherFailure, WeatherResponse> failureOrSuccess =
        await _weatherFacade.getWeatherForLocation(location: event.location);
    WeatherFailure wf;
    WeatherResponse wr;
    failureOrSuccess.fold((l) => {wf = l}, (r) => {wr = r});

    if (failureOrSuccess.isLeft()) {
      yield LoadingFailure(wf);
    } else {
      yield Loaded(
        WeatherEntity(
          id: UniqueId(),
          weatherResponse: some(wr),
          city: event.location,
          lastUpdated: some(
            DateTime.now(),
          ),
        ),
      );
    }
  }

  /// Yields [WeatherState.loaded(weatherEntity)] with a newly created [WeatherEntity] when the weather data has been refreshed successfully.
  ///
  /// Yields [WeatherState.loadingFailure()] when an error occured while refreshing the weather data.
  Stream<WeatherState> _mapRefreshWeatherToState(RefreshWeather event) async* {
    final Either<WeatherFailure, WeatherResponse> failureOrSuccess =
        await _weatherFacade.refreshWeatherData(location: event.location);

    WeatherFailure wf;
    WeatherResponse wr;
    failureOrSuccess.fold((l) => {wf = l}, (r) => {wr = r});
    if (failureOrSuccess.isLeft()) {
      yield LoadingFailure(wf);
    } else {
      yield Loaded(
        WeatherEntity(
          id: UniqueId(),
          weatherResponse: some(wr),
          city: event.location,
          lastUpdated: some(
            DateTime.now(),
          ),
        ),
      );
    }
  }
}
