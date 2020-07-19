import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Weather Event', () {
    final DateTime _mockTime = DateTime.now();
    test('cityChanged(String cityStr).toString() should return correct value',
        () {
      expect(const WeatherEvent.cityChanged('London').toString(),
          'WeatherEvent.cityChanged(cityStr: London)');
    });
    test('newSearch().toString() should return correct value', () {
      expect(const WeatherEvent.newSearch().toString(),
          'WeatherEvent.newSearch()');
    });
    test('loadFromStorage().toString() should return correct value', () {
      expect(const WeatherEvent.loadFromStorage().toString(),
          'WeatherEvent.loadFromStorage()');
    });
    test(
        'fetchWeatherForLocationWithQuery(String cityStr, DateTime requestTime ).toString() should return correct value',
        () {
      expect(
          WeatherEvent.fetchWeatherForLocationWithQuery(
                  cityStr: 'London', requestTime: _mockTime)
              .toString(),
          'WeatherEvent.fetchWeatherForLocationWithQuery(cityStr: London, requestTime: ${_mockTime.toString()})');
    });
    test(
        'fetchWeatherForLocationWithLattLong(double latt, double long, DateTime requestTime).toString() should return correct value',
        () {
      expect(
          WeatherEvent.fetchWeatherForLocationWithLattLong(
                  latt: 42.0, long: 17.2, requestTime: _mockTime)
              .toString(),
          'WeatherEvent.fetchWeatherForLocationWithLattLong(latt: 42.0, long: 17.2, requestTime: ${_mockTime.toString()})');
    });
    test(
        'refreshWeatherForLocation(String cityStr, DateTime requestTime).toString() should return correct value',
        () {
      expect(
          WeatherEvent.refreshWeatherForLocation(
                  cityStr: 'London', requestTime: _mockTime)
              .toString(),
          'WeatherEvent.refreshWeatherForLocation(cityStr: London, requestTime: ${_mockTime.toString()})');
    });
  });
}
