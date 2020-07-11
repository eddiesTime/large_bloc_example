// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'weather_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WeatherEventTearOff {
  const _$WeatherEventTearOff();

  CityChanged cityChanged(String cityStr) {
    return CityChanged(
      cityStr,
    );
  }

  NewSearch newSearch() {
    return const NewSearch();
  }

  FetchWeather fetchWeatherForLocation(String cityStr) {
    return FetchWeather(
      cityStr,
    );
  }

  RefreshWeather refreshWeatherForLocation(String cityStr) {
    return RefreshWeather(
      cityStr,
    );
  }
}

// ignore: unused_element
const $WeatherEvent = _$WeatherEventTearOff();

mixin _$WeatherEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cityChanged(String cityStr),
    @required Result newSearch(),
    @required Result fetchWeatherForLocation(String cityStr),
    @required Result refreshWeatherForLocation(String cityStr),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result fetchWeatherForLocation(String cityStr),
    Result refreshWeatherForLocation(String cityStr),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cityChanged(CityChanged value),
    @required Result newSearch(NewSearch value),
    @required Result fetchWeatherForLocation(FetchWeather value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result fetchWeatherForLocation(FetchWeather value),
    Result refreshWeatherForLocation(RefreshWeather value),
    @required Result orElse(),
  });
}

abstract class $WeatherEventCopyWith<$Res> {
  factory $WeatherEventCopyWith(
          WeatherEvent value, $Res Function(WeatherEvent) then) =
      _$WeatherEventCopyWithImpl<$Res>;
}

class _$WeatherEventCopyWithImpl<$Res> implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._value, this._then);

  final WeatherEvent _value;
  // ignore: unused_field
  final $Res Function(WeatherEvent) _then;
}

abstract class $CityChangedCopyWith<$Res> {
  factory $CityChangedCopyWith(
          CityChanged value, $Res Function(CityChanged) then) =
      _$CityChangedCopyWithImpl<$Res>;
  $Res call({String cityStr});
}

class _$CityChangedCopyWithImpl<$Res> extends _$WeatherEventCopyWithImpl<$Res>
    implements $CityChangedCopyWith<$Res> {
  _$CityChangedCopyWithImpl(
      CityChanged _value, $Res Function(CityChanged) _then)
      : super(_value, (v) => _then(v as CityChanged));

  @override
  CityChanged get _value => super._value as CityChanged;

  @override
  $Res call({
    Object cityStr = freezed,
  }) {
    return _then(CityChanged(
      cityStr == freezed ? _value.cityStr : cityStr as String,
    ));
  }
}

class _$CityChanged with DiagnosticableTreeMixin implements CityChanged {
  const _$CityChanged(this.cityStr) : assert(cityStr != null);

  @override
  final String cityStr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherEvent.cityChanged(cityStr: $cityStr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherEvent.cityChanged'))
      ..add(DiagnosticsProperty('cityStr', cityStr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CityChanged &&
            (identical(other.cityStr, cityStr) ||
                const DeepCollectionEquality().equals(other.cityStr, cityStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cityStr);

  @override
  $CityChangedCopyWith<CityChanged> get copyWith =>
      _$CityChangedCopyWithImpl<CityChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cityChanged(String cityStr),
    @required Result newSearch(),
    @required Result fetchWeatherForLocation(String cityStr),
    @required Result refreshWeatherForLocation(String cityStr),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return cityChanged(cityStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result fetchWeatherForLocation(String cityStr),
    Result refreshWeatherForLocation(String cityStr),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cityChanged != null) {
      return cityChanged(cityStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cityChanged(CityChanged value),
    @required Result newSearch(NewSearch value),
    @required Result fetchWeatherForLocation(FetchWeather value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return cityChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result fetchWeatherForLocation(FetchWeather value),
    Result refreshWeatherForLocation(RefreshWeather value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cityChanged != null) {
      return cityChanged(this);
    }
    return orElse();
  }
}

abstract class CityChanged implements WeatherEvent {
  const factory CityChanged(String cityStr) = _$CityChanged;

  String get cityStr;
  $CityChangedCopyWith<CityChanged> get copyWith;
}

abstract class $NewSearchCopyWith<$Res> {
  factory $NewSearchCopyWith(NewSearch value, $Res Function(NewSearch) then) =
      _$NewSearchCopyWithImpl<$Res>;
}

class _$NewSearchCopyWithImpl<$Res> extends _$WeatherEventCopyWithImpl<$Res>
    implements $NewSearchCopyWith<$Res> {
  _$NewSearchCopyWithImpl(NewSearch _value, $Res Function(NewSearch) _then)
      : super(_value, (v) => _then(v as NewSearch));

  @override
  NewSearch get _value => super._value as NewSearch;
}

class _$NewSearch with DiagnosticableTreeMixin implements NewSearch {
  const _$NewSearch();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherEvent.newSearch()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'WeatherEvent.newSearch'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NewSearch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cityChanged(String cityStr),
    @required Result newSearch(),
    @required Result fetchWeatherForLocation(String cityStr),
    @required Result refreshWeatherForLocation(String cityStr),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return newSearch();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result fetchWeatherForLocation(String cityStr),
    Result refreshWeatherForLocation(String cityStr),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newSearch != null) {
      return newSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cityChanged(CityChanged value),
    @required Result newSearch(NewSearch value),
    @required Result fetchWeatherForLocation(FetchWeather value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return newSearch(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result fetchWeatherForLocation(FetchWeather value),
    Result refreshWeatherForLocation(RefreshWeather value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newSearch != null) {
      return newSearch(this);
    }
    return orElse();
  }
}

abstract class NewSearch implements WeatherEvent {
  const factory NewSearch() = _$NewSearch;
}

abstract class $FetchWeatherCopyWith<$Res> {
  factory $FetchWeatherCopyWith(
          FetchWeather value, $Res Function(FetchWeather) then) =
      _$FetchWeatherCopyWithImpl<$Res>;
  $Res call({String cityStr});
}

class _$FetchWeatherCopyWithImpl<$Res> extends _$WeatherEventCopyWithImpl<$Res>
    implements $FetchWeatherCopyWith<$Res> {
  _$FetchWeatherCopyWithImpl(
      FetchWeather _value, $Res Function(FetchWeather) _then)
      : super(_value, (v) => _then(v as FetchWeather));

  @override
  FetchWeather get _value => super._value as FetchWeather;

  @override
  $Res call({
    Object cityStr = freezed,
  }) {
    return _then(FetchWeather(
      cityStr == freezed ? _value.cityStr : cityStr as String,
    ));
  }
}

class _$FetchWeather with DiagnosticableTreeMixin implements FetchWeather {
  const _$FetchWeather(this.cityStr) : assert(cityStr != null);

  @override
  final String cityStr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherEvent.fetchWeatherForLocation(cityStr: $cityStr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherEvent.fetchWeatherForLocation'))
      ..add(DiagnosticsProperty('cityStr', cityStr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchWeather &&
            (identical(other.cityStr, cityStr) ||
                const DeepCollectionEquality().equals(other.cityStr, cityStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cityStr);

  @override
  $FetchWeatherCopyWith<FetchWeather> get copyWith =>
      _$FetchWeatherCopyWithImpl<FetchWeather>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cityChanged(String cityStr),
    @required Result newSearch(),
    @required Result fetchWeatherForLocation(String cityStr),
    @required Result refreshWeatherForLocation(String cityStr),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return fetchWeatherForLocation(cityStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result fetchWeatherForLocation(String cityStr),
    Result refreshWeatherForLocation(String cityStr),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchWeatherForLocation != null) {
      return fetchWeatherForLocation(cityStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cityChanged(CityChanged value),
    @required Result newSearch(NewSearch value),
    @required Result fetchWeatherForLocation(FetchWeather value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return fetchWeatherForLocation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result fetchWeatherForLocation(FetchWeather value),
    Result refreshWeatherForLocation(RefreshWeather value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchWeatherForLocation != null) {
      return fetchWeatherForLocation(this);
    }
    return orElse();
  }
}

abstract class FetchWeather implements WeatherEvent {
  const factory FetchWeather(String cityStr) = _$FetchWeather;

  String get cityStr;
  $FetchWeatherCopyWith<FetchWeather> get copyWith;
}

abstract class $RefreshWeatherCopyWith<$Res> {
  factory $RefreshWeatherCopyWith(
          RefreshWeather value, $Res Function(RefreshWeather) then) =
      _$RefreshWeatherCopyWithImpl<$Res>;
  $Res call({String cityStr});
}

class _$RefreshWeatherCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res>
    implements $RefreshWeatherCopyWith<$Res> {
  _$RefreshWeatherCopyWithImpl(
      RefreshWeather _value, $Res Function(RefreshWeather) _then)
      : super(_value, (v) => _then(v as RefreshWeather));

  @override
  RefreshWeather get _value => super._value as RefreshWeather;

  @override
  $Res call({
    Object cityStr = freezed,
  }) {
    return _then(RefreshWeather(
      cityStr == freezed ? _value.cityStr : cityStr as String,
    ));
  }
}

class _$RefreshWeather with DiagnosticableTreeMixin implements RefreshWeather {
  const _$RefreshWeather(this.cityStr) : assert(cityStr != null);

  @override
  final String cityStr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherEvent.refreshWeatherForLocation(cityStr: $cityStr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'WeatherEvent.refreshWeatherForLocation'))
      ..add(DiagnosticsProperty('cityStr', cityStr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RefreshWeather &&
            (identical(other.cityStr, cityStr) ||
                const DeepCollectionEquality().equals(other.cityStr, cityStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cityStr);

  @override
  $RefreshWeatherCopyWith<RefreshWeather> get copyWith =>
      _$RefreshWeatherCopyWithImpl<RefreshWeather>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cityChanged(String cityStr),
    @required Result newSearch(),
    @required Result fetchWeatherForLocation(String cityStr),
    @required Result refreshWeatherForLocation(String cityStr),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return refreshWeatherForLocation(cityStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result fetchWeatherForLocation(String cityStr),
    Result refreshWeatherForLocation(String cityStr),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshWeatherForLocation != null) {
      return refreshWeatherForLocation(cityStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cityChanged(CityChanged value),
    @required Result newSearch(NewSearch value),
    @required Result fetchWeatherForLocation(FetchWeather value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return refreshWeatherForLocation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result fetchWeatherForLocation(FetchWeather value),
    Result refreshWeatherForLocation(RefreshWeather value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshWeatherForLocation != null) {
      return refreshWeatherForLocation(this);
    }
    return orElse();
  }
}

abstract class RefreshWeather implements WeatherEvent {
  const factory RefreshWeather(String cityStr) = _$RefreshWeather;

  String get cityStr;
  $RefreshWeatherCopyWith<RefreshWeather> get copyWith;
}

class _$WeatherStateTearOff {
  const _$WeatherStateTearOff();

  _WeatherState call(
      {@required
          WeatherEntity weatherEntity,
      @required
          City city,
      @required
          bool showErrorMessages,
      @required
          bool isLoading,
      @required
          Option<Either<WeatherFailure, WeatherResponse>>
              weatherFailureOrSuccessOption}) {
    return _WeatherState(
      weatherEntity: weatherEntity,
      city: city,
      showErrorMessages: showErrorMessages,
      isLoading: isLoading,
      weatherFailureOrSuccessOption: weatherFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $WeatherState = _$WeatherStateTearOff();

mixin _$WeatherState {
  WeatherEntity get weatherEntity;
  City get city;
  bool get showErrorMessages;
  bool get isLoading;
  Option<Either<WeatherFailure, WeatherResponse>>
      get weatherFailureOrSuccessOption;

  $WeatherStateCopyWith<WeatherState> get copyWith;
}

abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res>;
  $Res call(
      {WeatherEntity weatherEntity,
      City city,
      bool showErrorMessages,
      bool isLoading,
      Option<Either<WeatherFailure, WeatherResponse>>
          weatherFailureOrSuccessOption});

  $WeatherEntityCopyWith<$Res> get weatherEntity;
}

class _$WeatherStateCopyWithImpl<$Res> implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  final WeatherState _value;
  // ignore: unused_field
  final $Res Function(WeatherState) _then;

  @override
  $Res call({
    Object weatherEntity = freezed,
    Object city = freezed,
    Object showErrorMessages = freezed,
    Object isLoading = freezed,
    Object weatherFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      weatherEntity: weatherEntity == freezed
          ? _value.weatherEntity
          : weatherEntity as WeatherEntity,
      city: city == freezed ? _value.city : city as City,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      weatherFailureOrSuccessOption: weatherFailureOrSuccessOption == freezed
          ? _value.weatherFailureOrSuccessOption
          : weatherFailureOrSuccessOption
              as Option<Either<WeatherFailure, WeatherResponse>>,
    ));
  }

  @override
  $WeatherEntityCopyWith<$Res> get weatherEntity {
    if (_value.weatherEntity == null) {
      return null;
    }
    return $WeatherEntityCopyWith<$Res>(_value.weatherEntity, (value) {
      return _then(_value.copyWith(weatherEntity: value));
    });
  }
}

abstract class _$WeatherStateCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$WeatherStateCopyWith(
          _WeatherState value, $Res Function(_WeatherState) then) =
      __$WeatherStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {WeatherEntity weatherEntity,
      City city,
      bool showErrorMessages,
      bool isLoading,
      Option<Either<WeatherFailure, WeatherResponse>>
          weatherFailureOrSuccessOption});

  @override
  $WeatherEntityCopyWith<$Res> get weatherEntity;
}

class __$WeatherStateCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherStateCopyWith<$Res> {
  __$WeatherStateCopyWithImpl(
      _WeatherState _value, $Res Function(_WeatherState) _then)
      : super(_value, (v) => _then(v as _WeatherState));

  @override
  _WeatherState get _value => super._value as _WeatherState;

  @override
  $Res call({
    Object weatherEntity = freezed,
    Object city = freezed,
    Object showErrorMessages = freezed,
    Object isLoading = freezed,
    Object weatherFailureOrSuccessOption = freezed,
  }) {
    return _then(_WeatherState(
      weatherEntity: weatherEntity == freezed
          ? _value.weatherEntity
          : weatherEntity as WeatherEntity,
      city: city == freezed ? _value.city : city as City,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      weatherFailureOrSuccessOption: weatherFailureOrSuccessOption == freezed
          ? _value.weatherFailureOrSuccessOption
          : weatherFailureOrSuccessOption
              as Option<Either<WeatherFailure, WeatherResponse>>,
    ));
  }
}

class _$_WeatherState with DiagnosticableTreeMixin implements _WeatherState {
  const _$_WeatherState(
      {@required this.weatherEntity,
      @required this.city,
      @required this.showErrorMessages,
      @required this.isLoading,
      @required this.weatherFailureOrSuccessOption})
      : assert(weatherEntity != null),
        assert(city != null),
        assert(showErrorMessages != null),
        assert(isLoading != null),
        assert(weatherFailureOrSuccessOption != null);

  @override
  final WeatherEntity weatherEntity;
  @override
  final City city;
  @override
  final bool showErrorMessages;
  @override
  final bool isLoading;
  @override
  final Option<Either<WeatherFailure, WeatherResponse>>
      weatherFailureOrSuccessOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherState(weatherEntity: $weatherEntity, city: $city, showErrorMessages: $showErrorMessages, isLoading: $isLoading, weatherFailureOrSuccessOption: $weatherFailureOrSuccessOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherState'))
      ..add(DiagnosticsProperty('weatherEntity', weatherEntity))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('showErrorMessages', showErrorMessages))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty(
          'weatherFailureOrSuccessOption', weatherFailureOrSuccessOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherState &&
            (identical(other.weatherEntity, weatherEntity) ||
                const DeepCollectionEquality()
                    .equals(other.weatherEntity, weatherEntity)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.weatherFailureOrSuccessOption,
                    weatherFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.weatherFailureOrSuccessOption,
                    weatherFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(weatherEntity) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(weatherFailureOrSuccessOption);

  @override
  _$WeatherStateCopyWith<_WeatherState> get copyWith =>
      __$WeatherStateCopyWithImpl<_WeatherState>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {@required
          WeatherEntity weatherEntity,
      @required
          City city,
      @required
          bool showErrorMessages,
      @required
          bool isLoading,
      @required
          Option<Either<WeatherFailure, WeatherResponse>>
              weatherFailureOrSuccessOption}) = _$_WeatherState;

  @override
  WeatherEntity get weatherEntity;
  @override
  City get city;
  @override
  bool get showErrorMessages;
  @override
  bool get isLoading;
  @override
  Option<Either<WeatherFailure, WeatherResponse>>
      get weatherFailureOrSuccessOption;
  @override
  _$WeatherStateCopyWith<_WeatherState> get copyWith;
}
