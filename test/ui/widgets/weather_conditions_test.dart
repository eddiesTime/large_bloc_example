import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/weather_conditions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

void main() {
  group('Weather Conditions Widget', () {
    testWidgets('renders correctly for weather condition "hail"',
        (WidgetTester tester) async {
      const WeatherCondition _weatherCondition = WeatherCondition.hail;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherConditions(
              condition: _weatherCondition,
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate((widget) =>
          widget is Image && widget.key == Key(_weatherCondition.toString()));
      expect(finder, findsOneWidget);
      expect(() => WeatherConditions(condition: null), throwsAssertionError);
    });
    testWidgets('renders correctly for weather condition "snow"',
        (WidgetTester tester) async {
      const WeatherCondition _weatherCondition = WeatherCondition.snow;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherConditions(
              condition: _weatherCondition,
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate((widget) =>
          widget is Image && widget.key == Key(_weatherCondition.toString()));
      expect(finder, findsOneWidget);
    });
    testWidgets('renders correctly for weather condition "sleet"',
        (WidgetTester tester) async {
      const WeatherCondition _weatherCondition = WeatherCondition.sleet;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherConditions(
              condition: _weatherCondition,
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate((widget) =>
          widget is Image && widget.key == Key(_weatherCondition.toString()));
      expect(finder, findsOneWidget);
    });
    testWidgets('renders correctly for weather condition "heavyCloud"',
        (WidgetTester tester) async {
      const WeatherCondition _weatherCondition = WeatherCondition.heavyCloud;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherConditions(
              condition: _weatherCondition,
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate((widget) =>
          widget is Image && widget.key == Key(_weatherCondition.toString()));
      expect(finder, findsOneWidget);
    });
    testWidgets('renders correctly for weather condition "heavyRain"',
        (WidgetTester tester) async {
      const WeatherCondition _weatherCondition = WeatherCondition.heavyRain;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherConditions(
              condition: _weatherCondition,
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate((widget) =>
          widget is Image && widget.key == Key(_weatherCondition.toString()));
      expect(finder, findsOneWidget);
    });
    testWidgets('renders correctly for weather condition "lightRain"',
        (WidgetTester tester) async {
      const WeatherCondition _weatherCondition = WeatherCondition.lightRain;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherConditions(
              condition: _weatherCondition,
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate((widget) =>
          widget is Image && widget.key == Key(_weatherCondition.toString()));
      expect(finder, findsOneWidget);
    });
    testWidgets('renders correctly for weather condition "showers"',
        (WidgetTester tester) async {
      const WeatherCondition _weatherCondition = WeatherCondition.showers;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherConditions(
              condition: _weatherCondition,
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate((widget) =>
          widget is Image && widget.key == Key(_weatherCondition.toString()));
      expect(finder, findsOneWidget);
    });
    testWidgets('renders correctly for weather condition "thunderstorm"',
        (WidgetTester tester) async {
      const WeatherCondition _weatherCondition = WeatherCondition.thunderstorm;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherConditions(
              condition: _weatherCondition,
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate((widget) =>
          widget is Image && widget.key == Key(_weatherCondition.toString()));
      expect(finder, findsOneWidget);
    });
    testWidgets('renders correctly for weather condition "unknown"',
        (WidgetTester tester) async {
      const WeatherCondition _weatherCondition = WeatherCondition.unknown;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherConditions(
              condition: _weatherCondition,
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate((widget) =>
          widget is Image && widget.key == Key(_weatherCondition.toString()));
      expect(finder, findsOneWidget);
    });
  });
}
