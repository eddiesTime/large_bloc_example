part of 'weather_bloc.dart';

/// An interface that specifies weather events.
@freezed
abstract class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.cityChanged(String cityStr) = CityChanged;
  const factory WeatherEvent.newSearch() = NewSearch;

  /// Specifies a weather event to fetch weather data for a given [location].
  const factory WeatherEvent.fetchWeatherForLocation(String cityStr) =
      FetchWeather;

  /// Specifies a weather event to refresh weather data for a given [location].
  const factory WeatherEvent.refreshWeatherForLocation(String cityStr) =
      RefreshWeather;
}
