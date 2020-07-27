import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:flutter_bloc_example/domain/core/value_object.dart';
import 'package:flutter_bloc_example/domain/local_storage/local_storage_failure.dart';
import 'package:flutter_bloc_example/domain/weather/value_objects.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_bloc_example/domain/weather/weather_failure.dart';
import 'package:flutter_bloc_example/infrastructure/geolocation/geolocator_facade.dart';
import 'package:flutter_bloc_example/infrastructure/local_storage/local_storage_facade.dart';
import 'package:flutter_bloc_example/infrastructure/weather/weather_repository_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class MockWeatherRepositoryFacade extends Mock
    implements WeatherRepositoryFacade {}

class MockGeolocationFacade extends Mock implements GeolocatorFacade {}

class MockLocalStorageFacade extends Mock implements LocalStorageFacade {}

class MockWeatherResponse extends Mock implements WeatherResponse {
  @override
  final String title = 'London';
}

class MockWeatherEntity extends Mock implements WeatherEntity {
  @override
  final Option<WeatherResponse> weatherResponse;

  MockWeatherEntity(this.weatherResponse);
}

class MockWeatherBloc extends MockBloc<WeatherState> implements WeatherBloc {}

class MockWeatherFailure extends Mock implements WeatherFailure {}

void main() {
  group('WeatherBloc', () {
    WeatherRepositoryFacade _weatherRepositoryFacade;
    GeolocatorFacade _geoLocatorFacade;
    LocalStorageFacade _localStorageFacade;
    WeatherResponse _weatherResponse;
    WeatherBloc _weatherBloc;
    final WeatherState _initial = WeatherState.initial();
    final DateTime _mockTime = DateTime.now();

    WeatherEntity _weatherEntity;

    setUp(() {
      _weatherRepositoryFacade = MockWeatherRepositoryFacade();
      _geoLocatorFacade = MockGeolocationFacade();
      _localStorageFacade = MockLocalStorageFacade();
      _weatherResponse = MockWeatherResponse();
      _weatherEntity = MockWeatherEntity(some(_weatherResponse));

      _weatherBloc = WeatherBloc(
        _weatherRepositoryFacade,
        _geoLocatorFacade,
        _localStorageFacade,
      );
    });

    // Initial state
    test('initial state is WeatherState.initial()', () {
      expect(_weatherBloc.state.city, _initial.city);
      expect(_weatherBloc.state.isLoading, _initial.isLoading);
      expect(_weatherBloc.state.showErrorMessages, _initial.showErrorMessages);
      expect(_weatherBloc.state.weatherEntity.id, isA<UniqueId>());
      expect(_weatherBloc.state.weatherEntity.lastUpdated,
          _initial.weatherEntity.lastUpdated);
      expect(_weatherBloc.state.weatherEntity.weatherResponse,
          _initial.weatherEntity.weatherResponse);
      expect(_weatherBloc.state.weatherFailureOrSuccessOption,
          _initial.weatherFailureOrSuccessOption);
    });

    // cityChanged
    test(
        'should check whether state is yielded correctly for cityChanged() event',
        () async {
      final WeatherBloc _bloc = WeatherBloc(
          _weatherRepositoryFacade, _geoLocatorFacade, _localStorageFacade);
      _bloc.add(const CityChanged('London'));
      await emitsExactly(_bloc, [
        _bloc.state.copyWith(
          city: City('London'),
          weatherFailureOrSuccessOption: none(),
        )
      ]);
    });

    // new Search
    test(
        'should check whether state is yielded correctly for newSearch() event',
        () async {
      final WeatherBloc _bloc = WeatherBloc(
          _weatherRepositoryFacade, _geoLocatorFacade, _localStorageFacade);
      _bloc.add(const NewSearch());

      await emitsExactly(_bloc, [isA<WeatherState>()], skip: 0);
      expect(_bloc.state.showErrorMessages, false);
    });

    // loadFromStorage
    test(
        'should check whether state is yielded correctly for loadFromStorage() event for failure case',
        () async {
      final WeatherBloc _bloc = WeatherBloc(
          _weatherRepositoryFacade, _geoLocatorFacade, _localStorageFacade);
      when(_localStorageFacade.loadWeatherDataFromLocalStorage())
          .thenAnswer((_) => left(const LocalStorageFailure.noDataStored()));
      _bloc.add(const LoadFromStorage());

      await emitsExactly(_bloc, [isA<WeatherState>()], skip: 0);
      expect(_bloc.state.city, _initial.city);
      expect(_bloc.state.isLoading, _initial.isLoading);
      expect(_bloc.state.showErrorMessages, _initial.showErrorMessages);
      expect(_bloc.state.weatherEntity.id, isA<UniqueId>());
      expect(_bloc.state.weatherEntity.lastUpdated,
          _initial.weatherEntity.lastUpdated);
      expect(_bloc.state.weatherEntity.weatherResponse,
          _initial.weatherEntity.weatherResponse);
      expect(_bloc.state.weatherFailureOrSuccessOption,
          _initial.weatherFailureOrSuccessOption);
    });

    test(
        'should check whether state is yielded correctly for loadFromStorage() event for success case',
        () async {
      final WeatherBloc _bloc = WeatherBloc(
          _weatherRepositoryFacade, _geoLocatorFacade, _localStorageFacade);
      when(_localStorageFacade.loadWeatherDataFromLocalStorage())
          .thenAnswer((_) => right(_weatherEntity));
      _bloc.add(const LoadFromStorage());
      await emitsExactly(_bloc, [
        _bloc.state.copyWith(
          city: City('London'),
          weatherEntity: _weatherEntity,
          showErrorMessages: true,
          weatherFailureOrSuccessOption: some(
            right(_weatherResponse),
          ),
        ),
      ]);
      expect(_bloc.state.city, City('London'));
      expect(_bloc.state.isLoading, false);
      expect(_bloc.state.showErrorMessages, true);
      expect(_bloc.state.weatherEntity, _weatherEntity);
      expect(
        _bloc.state.weatherFailureOrSuccessOption,
        some(
          right(_weatherResponse),
        ),
      );
    });

    // fetchForQuery
    test(
        'should check whether state is yielded correctly for actionOnWeatherFacadeWithQuery() event for empty string',
        () async {
      final WeatherBloc _bloc = WeatherBloc(
          _weatherRepositoryFacade, _geoLocatorFacade, _localStorageFacade);
      _bloc.add(FetchWeatherWithQuery(cityStr: '', requestTime: _mockTime));
      await emitsExactly(_bloc, [
        _bloc.state.copyWith(
          city: City(''),
          showErrorMessages: true,
        ),
      ]);
      expect(_bloc.state.city, City(''));
      expect(_bloc.state.showErrorMessages, true);
    });

    test(
        'should check whether state is yielded correctly for actionOnWeatherFacadeWithQuery() for fetch weather with query event and WeatherFailure response',
        () async {
      final Either<WeatherFailure, WeatherResponse> _failure =
          left(const WeatherFailure.notALocation());
      final WeatherBloc _bloc = WeatherBloc(
          _weatherRepositoryFacade, _geoLocatorFacade, _localStorageFacade);
      when(_weatherRepositoryFacade.getWeatherWithQuery(city: City('abc123')))
          .thenAnswer((_) => Future.value(_failure));
      _bloc.add(
          FetchWeatherWithQuery(cityStr: 'abc123', requestTime: _mockTime));
      await emitsExactly(_bloc, [
        _bloc.state.copyWith(
          city: City('abc123'),
          isLoading: true,
          weatherFailureOrSuccessOption: none(),
        ),
        _bloc.state.copyWith(
          city: City('abc123'),
          isLoading: false,
          showErrorMessages: true,
          weatherFailureOrSuccessOption:
              some(left(const WeatherFailure.notALocation())),
        ),
      ]);
    });
    test(
        'should check whether state is yielded correctly for actionOnWeatherFacadeWithQuery() for fetch weather with query event and WeatherResponse',
        () async {
      final Either<WeatherFailure, WeatherResponse> _success =
          right(_weatherResponse);
      final WeatherBloc _bloc = WeatherBloc(
          _weatherRepositoryFacade, _geoLocatorFacade, _localStorageFacade);
      when(_weatherRepositoryFacade.getWeatherWithQuery(city: City('London')))
          .thenAnswer((_) => Future.value(_success));
      when(_localStorageFacade.saveToLocalStorage())
          .thenAnswer((_) => Future.value(true));
      _bloc.add(
          FetchWeatherWithQuery(cityStr: 'London', requestTime: _mockTime));
      await emitsExactly(_bloc, [
        _bloc.state.copyWith(
          city: City('London'),
          isLoading: true,
          weatherFailureOrSuccessOption: none(),
        ),
        _bloc.state.copyWith(
          city: City('London'),
          weatherEntity: _bloc.state.weatherEntity.copyWith(
              weatherResponse: some(_weatherResponse),
              lastUpdated: some(_mockTime)),
          isLoading: false,
          showErrorMessages: true,
          weatherFailureOrSuccessOption: some(right(_weatherResponse)),
        ),
      ]);
    });
    // fetchForLatLong
    test(
        'should check whether state is yielded correctly for _performActionToFetchWeatherDataForLattLong() for refresh weather with lat and long event and WeatherResponse',
        () async {
      final Either<WeatherFailure, WeatherResponse> _success =
          right(_weatherResponse);
      final WeatherBloc _bloc = WeatherBloc(
          _weatherRepositoryFacade, _geoLocatorFacade, _localStorageFacade);
      when(_weatherRepositoryFacade.getWeatherWithLattLong(
              latt: 42.0, long: 17.5))
          .thenAnswer((_) => Future.value(_success));
      when(_localStorageFacade.saveToLocalStorage())
          .thenAnswer((_) => Future.value(true));
      when(_geoLocatorFacade.getCurrentUserPosition())
          .thenAnswer((_) => Future.value(
                Position(latitude: 42.0, longitude: 17.5, mocked: true),
              ));
      _bloc.add(
        FetchWeatherWithLattLong(
          latt: 42.0,
          long: 17.5,
          requestTime: _mockTime,
        ),
      );
      await emitsExactly(_bloc, [
        _bloc.state.copyWith(
          isLoading: true,
          weatherFailureOrSuccessOption: none(),
        ),
        _bloc.state.copyWith(
          city: City(_weatherResponse.title),
          weatherEntity: _bloc.state.weatherEntity.copyWith(
              weatherResponse: some(_weatherResponse),
              lastUpdated: some(_mockTime)),
          isLoading: false,
          showErrorMessages: true,
          weatherFailureOrSuccessOption: some(right(_weatherResponse)),
        ),
      ]);
    });
    test(
        'should check whether state is yielded correctly for _performActionToFetchWeatherDataForLattLong() for fetch weather with lat and long event and WeatherFailure response',
        () async {
      final Either<WeatherFailure, WeatherResponse> _failure =
          left(const WeatherFailure.noLocationFoundForLattLong());
      final WeatherBloc _bloc = WeatherBloc(
          _weatherRepositoryFacade, _geoLocatorFacade, _localStorageFacade);
      when(_weatherRepositoryFacade.getWeatherWithLattLong(
              latt: 42.0, long: 17.5))
          .thenAnswer((_) => Future.value(_failure));
      when(_localStorageFacade.saveToLocalStorage())
          .thenAnswer((_) => Future.value(true));
      when(_geoLocatorFacade.getCurrentUserPosition())
          .thenAnswer((_) => Future.value(
                Position(latitude: 42.0, longitude: 17.5, mocked: true),
              ));
      _bloc.add(
        FetchWeatherWithLattLong(
          latt: 42.0,
          long: 17.5,
          requestTime: _mockTime,
        ),
      );
      await emitsExactly(_bloc, [
        _bloc.state.copyWith(
          isLoading: true,
          weatherFailureOrSuccessOption: none(),
        ),
        _bloc.state.copyWith(
          isLoading: false,
          showErrorMessages: true,
          weatherFailureOrSuccessOption:
              some(left(const WeatherFailure.noLocationFoundForLattLong())),
        ),
      ]);
    });

    // refresh

    test(
        'should check whether state is yielded correctly for actionOnWeatherFacadeWithQuery() for refresh weather with query event and WeatherResponse',
        () async {
      final Either<WeatherFailure, WeatherResponse> _success =
          right(_weatherResponse);
      final WeatherBloc _bloc = WeatherBloc(
          _weatherRepositoryFacade, _geoLocatorFacade, _localStorageFacade);
      when(_weatherRepositoryFacade.refreshWeatherData(city: City('London')))
          .thenAnswer((_) => Future.value(_success));
      when(_localStorageFacade.saveToLocalStorage())
          .thenAnswer((_) => Future.value(true));
      _bloc.add(RefreshWeather(cityStr: 'London', requestTime: _mockTime));
      await emitsExactly(_bloc, [
        _bloc.state.copyWith(
          city: City('London'),
          weatherEntity: _bloc.state.weatherEntity.copyWith(
              weatherResponse: some(_weatherResponse),
              lastUpdated: some(_mockTime)),
          isLoading: false,
          showErrorMessages: true,
          weatherFailureOrSuccessOption: some(right(_weatherResponse)),
        ),
      ]);
    });
    test(
        'should check whether state is yielded correctly for actionOnWeatherFacadeWithQuery() for fetch weather with query event and WeatherFailure response',
        () async {
      final Either<WeatherFailure, WeatherResponse> _failure =
          left(const WeatherFailure.unableToRefresh());
      final WeatherBloc _bloc = WeatherBloc(
          _weatherRepositoryFacade, _geoLocatorFacade, _localStorageFacade);
      when(_weatherRepositoryFacade.refreshWeatherData(city: City('abc123')))
          .thenAnswer((_) => Future.value(_failure));
      _bloc.add(RefreshWeather(cityStr: 'abc123', requestTime: _mockTime));
      await emitsExactly(_bloc, [
        _bloc.state.copyWith(
          city: City('abc123'),
          isLoading: false,
          showErrorMessages: true,
          weatherFailureOrSuccessOption:
              some(left(const WeatherFailure.unableToRefresh())),
        ),
      ]);
    });
  });
}
