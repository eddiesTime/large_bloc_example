import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/domain/geolocation/i_geolocation_facade.dart';
import 'package:flutter_bloc_example/domain/weather/i_weather_facade.dart';
import 'package:flutter_bloc_example/domain/weather/value_objects.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_bloc_example/domain/weather/weather_failure.dart';
import 'package:geolocator/geolocator.dart';
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
  final IGeolocationFacade _geolocationFacade;

  WeatherBloc(
    this._weatherFacade,
    this._geolocationFacade,
  ) : super(WeatherState.initial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield* event.map(
      cityChanged: (e) async* {
        yield state.copyWith(
          city: City(e.cityStr),
          weatherFailureOrSuccessOption: none(),
        );
      },
      newSearch: (e) async* {
        yield state.copyWith(showErrorMessages: false);
      },
      fetchWeatherForLocationWithLattLong: (e) async* {
        yield* _performActionToFetchWeatherDataForLattLong(e);
      },
      fetchWeatherForLocationWithQuery: (e) async* {
        yield* _performActionOnWeatherFacadeWithQuery(
            _weatherFacade.getWeatherWithQuery, e.cityStr, false);
      },
      refreshWeatherForLocation: (e) async* {
        yield* _performActionOnWeatherFacadeWithQuery(
            _weatherFacade.refreshWeatherData, e.cityStr, true);
      },
    );
  }

  /// Yields [WeatherState.loaded(weatherEntity)] with a newly created [WeatherEntity] when the weather data has been fetched successfully.
  ///
  /// Yields [WeatherState.loadingFailure()] when an error occured while fetchibg the weather data.
  Stream<WeatherState> _performActionOnWeatherFacadeWithQuery(
    Future<Either<WeatherFailure, WeatherResponse>> Function({
      @required City city,
    })
        forwardedCall,
    String cityStr,
    bool isRefreshCallBack,
  ) async* {
    final City _city = City(cityStr);
    if (cityStr.isEmpty) {
      yield state.copyWith(
        city: _city,
        showErrorMessages: true,
      );
    } else {
      Either<WeatherFailure, WeatherResponse> failureOrSuccess;

      final isCityValid = _city.isValid();

      if (isCityValid && !isRefreshCallBack) {
        yield state.copyWith(
          city: _city,
          isLoading: true,
          weatherFailureOrSuccessOption: none(),
        );
      }

      failureOrSuccess = await forwardedCall(
        city: _city,
      );

      WeatherFailure _wf;
      WeatherResponse _wr;
      failureOrSuccess.fold((l) => {_wf = l}, (r) => {_wr = r});

      if (failureOrSuccess.isLeft()) {
        yield state.copyWith(
          city: _city,
          isLoading: false,
          showErrorMessages: true,
          weatherFailureOrSuccessOption: some(left(_wf)),
        );
      } else {
        final WeatherEntity _we = state.weatherEntity.copyWith(
            weatherResponse: some(_wr), lastUpdated: some(DateTime.now()));
        yield state.copyWith(
          city: _city,
          weatherEntity: _we,
          isLoading: false,
          showErrorMessages: true,
          weatherFailureOrSuccessOption: some(right(_wr)),
        );
      }
    }

    // yield const Loading();
    // final Either<WeatherFailure, WeatherResponse> failureOrSuccess =
    //     await _weatherFacade.getWeatherForLocation(location: event.location);
    // WeatherFailure wf;
    // WeatherResponse wr;
    // failureOrSuccess.fold((l) => {wf = l}, (r) => {wr = r});

    // if (failureOrSuccess.isLeft()) {
    //   yield LoadingFailure(wf);
    // } else {
    //   yield Loaded(
    //     WeatherEntity(
    //       id: UniqueId(),
    //       weatherResponse: some(wr),
    //       city: event.location,
    //       lastUpdated: some(
    //         DateTime.now(),
    //       ),
    //     ),
    //   );
    // }
  }

  /// Yields [WeatherState.loaded(weatherEntity)] with a newly created [WeatherEntity] when the weather data has been refreshed successfully.
  ///
  /// Yields [WeatherState.loadingFailure()] when an error occured while refreshing the weather data.
  Stream<WeatherState> _performActionToFetchWeatherDataForLattLong(
      FetchWeatherWithLattLong event) async* {
    yield state.copyWith(
      isLoading: true,
      weatherFailureOrSuccessOption: none(),
    );
    final Position _userPosition =
        await _geolocationFacade.getCurrentUserPosition();
    final Either<WeatherFailure, WeatherResponse> failureOrSuccess =
        await _weatherFacade.getWeatherWithLattLong(
      latt: _userPosition.latitude,
      long: _userPosition.longitude,
    );

    WeatherFailure _wf;
    WeatherResponse _wr;
    failureOrSuccess.fold((l) => {_wf = l}, (r) => {_wr = r});

    if (failureOrSuccess.isLeft()) {
      yield state.copyWith(
        isLoading: false,
        showErrorMessages: true,
        weatherFailureOrSuccessOption: some(left(_wf)),
      );
    } else {
      final WeatherEntity _we = state.weatherEntity.copyWith(
          weatherResponse: some(_wr), lastUpdated: some(DateTime.now()));
      final City _city = City(_we.weatherResponse.getOrElse(() => null).title);
      yield state.copyWith(
        city: _city,
        weatherEntity: _we,
        isLoading: false,
        showErrorMessages: true,
        weatherFailureOrSuccessOption: some(right(_wr)),
      );
    }
  }
}
