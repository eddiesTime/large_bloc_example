part of 'weather_bloc.dart';

/// An interface to specify weather states.
@freezed
abstract class WeatherState with _$WeatherState {
  // /// Specifies a weather state that indicates the initial state.
  // const factory WeatherState.initial() = Initial;

  // /// Specifies a weather state that indicates the loading state.
  // const factory WeatherState.loading() = Loading;

  // /// Specifies a weather state that indicates a loading failure state.
  // const factory WeatherState.loadingFailure(WeatherFailure weatherFailure) =
  //     LoadingFailure;

  // /// Specifies a weather state that indicates a successful loading state.
  // const factory WeatherState.loaded(WeatherEntity weatherEntity) = Loaded;
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
