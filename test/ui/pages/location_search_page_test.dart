import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/blocs.dart';
import 'package:flutter_bloc_example/infrastructure/geolocation/geolocator_facade.dart';
import 'package:flutter_bloc_example/infrastructure/local_storage/local_storage_facade.dart';
import 'package:flutter_bloc_example/infrastructure/weather/weather_repository_facade.dart';
import 'package:flutter_bloc_example/presentation/location_search/pages/search_page.dart';
import 'package:flutter_bloc_example/presentation/location_search/widgets/city_selection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWeatherBloc extends MockBloc<WeatherState> implements WeatherBloc {}

class MockWeatherFacade extends Mock implements WeatherRepositoryFacade {}

class MockGeolocationFacade extends Mock implements GeolocatorFacade {}

class MockLocalStorageFacade extends Mock implements LocalStorageFacade {}

void main() {
  group('Location Search Page', () {
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
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(BlocProvider<WeatherBloc>.value(
          value: _weatherBloc,
          child: MaterialApp(title: 'Test', home: SearchPage())));
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(
          find.descendant(of: find.byType(AppBar), matching: find.text('City')),
          findsOneWidget);
      expect(find.byType(CitySelection), findsOneWidget);
    });
  });
}
