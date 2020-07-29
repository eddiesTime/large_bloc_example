// import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/blocs.dart';
// import 'package:flutter_bloc_example/domain/core/value_object.dart';
// import 'package:flutter_bloc_example/domain/theme/theme_entity.dart';
import 'package:flutter_bloc_example/domain/weather/value_objects.dart';
// import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_bloc_example/domain/weather/weather_failure.dart';
// import 'package:flutter_bloc_example/presentation/weather/widgets/combined_weather_temperature.dart';
// import 'package:flutter_bloc_example/presentation/weather/widgets/gradient_container.dart';
// import 'package:flutter_bloc_example/presentation/weather/widgets/last_updated.dart';
// import 'package:flutter_bloc_example/presentation/weather/widgets/location.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/weather.dart';
// import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart'
//     as model;
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:flutter/services.dart' show rootBundle;

class MockSettingsBloc extends MockBloc<SettingsState> implements SettingsBloc {
}

class MockWeatherBloc extends MockBloc<WeatherState> implements WeatherBloc {}

class MockThemeBloc extends MockBloc<ThemeState> implements ThemeBloc {}

void main() {
  group('Weather Widget', () {
    // SettingsBloc _settingsBloc;
    WeatherBloc _weatherBloc;
    // ThemeBloc _themeBloc;
    // model.WeatherResponse _mockQueryResponse;
    // model.Weather _weather;
    // WeatherEntity _mockEntity;
    // final DateTime _mockDate = DateTime.now();
    // final UniqueId _mockId = UniqueId();

    setUp(() async {
      // _settingsBloc = MockSettingsBloc();
      _weatherBloc = MockWeatherBloc();
      // _themeBloc = MockThemeBloc();
      // final String _mockResponseJsonString =
      //     await rootBundle.loadString('assets/latlong.json');
      // final List<dynamic> _mockResponseJson =
      //     jsonDecode(_mockResponseJsonString) as List<dynamic>;
      // _mockQueryResponse = model.WeatherResponse.fromJson(
      //     _mockResponseJson.first as Map<String, dynamic>);
      // _mockEntity = WeatherEntity(
      //     id: _mockId,
      //     lastUpdated: some(_mockDate),
      //     weatherResponse: some(_mockQueryResponse));
    });

    testWidgets('should render properly for WeatherState.initial',
        (WidgetTester tester) async {
      when(_weatherBloc.state).thenAnswer((_) => WeatherState.initial());
      await tester.pumpWidget(
        BlocProvider<WeatherBloc>.value(
          value: _weatherBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Weather(),
            ),
          ),
        ),
      );
      expect(find.byType(Center), findsNWidgets(2));
      expect(find.text('Please Select a Location'), findsOneWidget);
    });

    testWidgets('should render properly for WeatherState.loading',
        (WidgetTester tester) async {
      when(_weatherBloc.state)
          .thenAnswer((_) => WeatherState.initial().copyWith(
                city: City('London'),
                isLoading: true,
                weatherFailureOrSuccessOption: none(),
              ));
      await tester.pumpWidget(
        BlocProvider<WeatherBloc>.value(
          value: _weatherBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Weather(),
            ),
          ),
        ),
      );
      expect(find.byType(Center), findsNWidgets(2));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should render properly for WeatherState.loadingFailure',
        (WidgetTester tester) async {
      when(_weatherBloc.state)
          .thenAnswer((_) => WeatherState.initial().copyWith(
                city: City('Foo'),
                isLoading: false,
                showErrorMessages: true,
                weatherFailureOrSuccessOption:
                    some(left(const WeatherFailure.notALocation())),
              ));
      await tester.pumpWidget(
        BlocProvider<WeatherBloc>.value(
          value: _weatherBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Weather(),
            ),
          ),
        ),
      );
      expect(find.byType(Center), findsNWidgets(2));
      expect(find.text('Not a location!'), findsOneWidget);
    });

    // testWidgets('should render properly for WeatherState.loaded',
    //     (WidgetTester tester) async {
    //   when(_weatherBloc.state)
    //       .thenAnswer((_) => WeatherState.initial().copyWith(
    //             city: City(_mockQueryResponse.title),
    //             weatherEntity: _mockEntity,
    //             isLoading: false,
    //             showErrorMessages: true,
    //             weatherFailureOrSuccessOption: some(right(_mockQueryResponse)),
    //           ));
    //   when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
    //   when(_themeBloc.state)
    //       .thenAnswer((_) => ThemeState(themeEntity: ThemeEntity.initial()));
    //   // when(_weather.mapConditionToWeatherCondition(_weather.condition))
    //   //     .thenAnswer((_) => model.WeatherCondition.clear);
    //   // when(_weather.temp).thenAnswer((_) => 20);
    //   // when(_weather.minTemp).thenAnswer((_) => 19);
    //   // when(_weather.maxTemp).thenAnswer((_) => 21);
    //   // when(_weather.formattedCondition).thenAnswer((_) => 'TEST');
    //   await tester.pumpWidget(
    //     MultiBlocProvider(
    //       providers: [
    //         BlocProvider<WeatherBloc>.value(
    //           value: _weatherBloc,
    //         ),
    //         BlocProvider<SettingsBloc>.value(
    //           value: _settingsBloc,
    //         ),
    //         BlocProvider<ThemeBloc>.value(
    //           value: _themeBloc,
    //         ),
    //       ],
    //       child: MaterialApp(
    //         home: Scaffold(body: Weather()),
    //       ),
    //     ),
    //   );
    //   await tester.pumpAndSettle();
    //   expect(find.byType(Center), findsWidgets);
    //   expect(find.byType(Padding), findsWidgets);
    //   expect(find.byType(GradientContainer), findsOneWidget);
    //   expect(find.byType(ListView), findsOneWidget);
    //   expect(find.byType(Location), findsOneWidget);
    //   expect(find.byType(LastUpdated), findsOneWidget);
    //   expect(find.byType(CombinedWeatherTemperature), findsOneWidget);
    // });
  });
}
