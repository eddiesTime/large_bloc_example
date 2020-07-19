part of 'weather_bloc.dart';

/// An interface to specify weather states.
@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState({
    @required WeatherEntity weatherEntity,
    @required City city,
    @required bool showErrorMessages,
    @required bool isLoading,
    @required
        Option<Either<WeatherFailure, WeatherResponse>>
            weatherFailureOrSuccessOption,
  }) = _WeatherState;

  factory WeatherState.initial() => WeatherState(
        weatherEntity: WeatherEntity.initial(),
        city: City(''),
        showErrorMessages: false,
        isLoading: false,
        weatherFailureOrSuccessOption: none(),
      );
}
