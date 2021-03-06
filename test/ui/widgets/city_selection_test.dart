import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/blocs.dart';
import 'package:flutter_bloc_example/infrastructure/geolocation/geolocator_facade.dart';
import 'package:flutter_bloc_example/infrastructure/local_storage/local_storage_facade.dart';
import 'package:flutter_bloc_example/infrastructure/weather/weather_repository_facade.dart';
import 'package:flutter_bloc_example/presentation/location_search/widgets/city_selection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

class MockWeatherBloc extends MockBloc<WeatherState> implements WeatherBloc {}

class MockThemeBloc extends MockBloc<ThemeState> implements ThemeBloc {}

class MockWeatherFacade extends Mock implements WeatherRepositoryFacade {}

class MockGeolocationFacade extends Mock implements GeolocatorFacade {}

class MockLocalStorageFacade extends Mock implements LocalStorageFacade {}

void main() {
  group('City Selection Widget', () {
    WeatherBloc _weatherBloc;
    WeatherRepositoryFacade _weatherFacade;
    GeolocatorFacade _geolocatorFacade;
    LocalStorageFacade _localStorageFacade;

    setUp(() {
      _weatherFacade = MockWeatherFacade();
      _geolocatorFacade = MockGeolocationFacade();
      _localStorageFacade = MockLocalStorageFacade();
      _weatherBloc =
          WeatherBloc(_weatherFacade, _geolocatorFacade, _localStorageFacade);
    });
    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
              body: BlocProvider<WeatherBloc>.value(
                  value: _weatherBloc, child: CitySelection())),
        ),
      );
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Expanded), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('City'), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets('should check if the text input field registers an input',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<WeatherBloc>.value(
                value: _weatherBloc, child: CitySelection()),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField), 'London');
      await tester.pumpAndSettle();
      expect(find.text('London'), findsOneWidget);
    });

    // testWidgets(
    //     'should be popped of Navigation Stack when Icon Button is tapped',
    //     (WidgetTester tester) async {
    //   when(_themeBloc.state)
    //       .thenAnswer((_) => ThemeState(themeEntity: ThemeEntity.initial()));
    //   when(_weatherBloc.state).thenAnswer((_) => WeatherState.initial());
    //   await tester.pumpWidget(
    //     MultiBlocProvider(
    //       providers: [
    //         BlocProvider<WeatherBloc>.value(value: _weatherBloc),
    //         BlocProvider<ThemeBloc>.value(value: _themeBloc),
    //       ],
    //       child: MaterialApp(
    //         home: Scaffold(
    //           body: CitySelection(),
    //         ),
    //       ),
    //     ),
    //   );
    //   await tester.pumpAndSettle();
    //   await tester.enterText(find.byType(TextFormField), 'London');
    //   await tester.pumpAndSettle();
    //   await tester.tap(find.byType(IconButton));
    //   await tester.pumpAndSettle();
    //   expect(find.byType(CitySelection), findsNothing);
    // });
  });
}
