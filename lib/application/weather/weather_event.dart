part of 'weather_bloc.dart';

/// An interface that specifies weather events.
@freezed
abstract class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.cityChanged(String cityStr) = CityChanged;
  const factory WeatherEvent.newSearch() = NewSearch;
  const factory WeatherEvent.loadFromStorage() = LoadFromStorage;

  /// Specifies a weather event to fetch weather data for a given [location].
  const factory WeatherEvent.fetchWeatherForLocationWithQuery(String cityStr) =
      FetchWeatherWithQuery;

  /// Specifies a weather event to fetch weather data for a given [latt] and [long].
  const factory WeatherEvent.fetchWeatherForLocationWithLattLong(
      {double latt, double long}) = FetchWeatherWithLattLong;

  /// Specifies a weather event to refresh weather data for a given [location].
  const factory WeatherEvent.refreshWeatherForLocation(String cityStr) =
      RefreshWeather;
}
