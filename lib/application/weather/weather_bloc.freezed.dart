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

  LoadFromStorage loadFromStorage() {
    return const LoadFromStorage();
  }

  FetchWeatherWithQuery fetchWeatherForLocationWithQuery(String cityStr) {
    return FetchWeatherWithQuery(
      cityStr,
    );
  }

  FetchWeatherWithLattLong fetchWeatherForLocationWithLattLong(
      {double latt, double long}) {
    return FetchWeatherWithLattLong(
      latt: latt,
      long: long,
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
    @required Result loadFromStorage(),
    @required Result fetchWeatherForLocationWithQuery(String cityStr),
    @required
        Result fetchWeatherForLocationWithLattLong(double latt, double long),
    @required Result refreshWeatherForLocation(String cityStr),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result loadFromStorage(),
    Result fetchWeatherForLocationWithQuery(String cityStr),
    Result fetchWeatherForLocationWithLattLong(double latt, double long),
    Result refreshWeatherForLocation(String cityStr),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cityChanged(CityChanged value),
    @required Result newSearch(NewSearch value),
    @required Result loadFromStorage(LoadFromStorage value),
    @required
        Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    @required
        Result fetchWeatherForLocationWithLattLong(
            FetchWeatherWithLattLong value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result loadFromStorage(LoadFromStorage value),
    Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    Result fetchWeatherForLocationWithLattLong(FetchWeatherWithLattLong value),
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
    @required Result loadFromStorage(),
    @required Result fetchWeatherForLocationWithQuery(String cityStr),
    @required
        Result fetchWeatherForLocationWithLattLong(double latt, double long),
    @required Result refreshWeatherForLocation(String cityStr),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return cityChanged(cityStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result loadFromStorage(),
    Result fetchWeatherForLocationWithQuery(String cityStr),
    Result fetchWeatherForLocationWithLattLong(double latt, double long),
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
    @required Result loadFromStorage(LoadFromStorage value),
    @required
        Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    @required
        Result fetchWeatherForLocationWithLattLong(
            FetchWeatherWithLattLong value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return cityChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result loadFromStorage(LoadFromStorage value),
    Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    Result fetchWeatherForLocationWithLattLong(FetchWeatherWithLattLong value),
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
    @required Result loadFromStorage(),
    @required Result fetchWeatherForLocationWithQuery(String cityStr),
    @required
        Result fetchWeatherForLocationWithLattLong(double latt, double long),
    @required Result refreshWeatherForLocation(String cityStr),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return newSearch();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result loadFromStorage(),
    Result fetchWeatherForLocationWithQuery(String cityStr),
    Result fetchWeatherForLocationWithLattLong(double latt, double long),
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
    @required Result loadFromStorage(LoadFromStorage value),
    @required
        Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    @required
        Result fetchWeatherForLocationWithLattLong(
            FetchWeatherWithLattLong value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return newSearch(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result loadFromStorage(LoadFromStorage value),
    Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    Result fetchWeatherForLocationWithLattLong(FetchWeatherWithLattLong value),
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

abstract class $LoadFromStorageCopyWith<$Res> {
  factory $LoadFromStorageCopyWith(
          LoadFromStorage value, $Res Function(LoadFromStorage) then) =
      _$LoadFromStorageCopyWithImpl<$Res>;
}

class _$LoadFromStorageCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res>
    implements $LoadFromStorageCopyWith<$Res> {
  _$LoadFromStorageCopyWithImpl(
      LoadFromStorage _value, $Res Function(LoadFromStorage) _then)
      : super(_value, (v) => _then(v as LoadFromStorage));

  @override
  LoadFromStorage get _value => super._value as LoadFromStorage;
}

class _$LoadFromStorage
    with DiagnosticableTreeMixin
    implements LoadFromStorage {
  const _$LoadFromStorage();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherEvent.loadFromStorage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherEvent.loadFromStorage'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadFromStorage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cityChanged(String cityStr),
    @required Result newSearch(),
    @required Result loadFromStorage(),
    @required Result fetchWeatherForLocationWithQuery(String cityStr),
    @required
        Result fetchWeatherForLocationWithLattLong(double latt, double long),
    @required Result refreshWeatherForLocation(String cityStr),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return loadFromStorage();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result loadFromStorage(),
    Result fetchWeatherForLocationWithQuery(String cityStr),
    Result fetchWeatherForLocationWithLattLong(double latt, double long),
    Result refreshWeatherForLocation(String cityStr),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFromStorage != null) {
      return loadFromStorage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cityChanged(CityChanged value),
    @required Result newSearch(NewSearch value),
    @required Result loadFromStorage(LoadFromStorage value),
    @required
        Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    @required
        Result fetchWeatherForLocationWithLattLong(
            FetchWeatherWithLattLong value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return loadFromStorage(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result loadFromStorage(LoadFromStorage value),
    Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    Result fetchWeatherForLocationWithLattLong(FetchWeatherWithLattLong value),
    Result refreshWeatherForLocation(RefreshWeather value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFromStorage != null) {
      return loadFromStorage(this);
    }
    return orElse();
  }
}

abstract class LoadFromStorage implements WeatherEvent {
  const factory LoadFromStorage() = _$LoadFromStorage;
}

abstract class $FetchWeatherWithQueryCopyWith<$Res> {
  factory $FetchWeatherWithQueryCopyWith(FetchWeatherWithQuery value,
          $Res Function(FetchWeatherWithQuery) then) =
      _$FetchWeatherWithQueryCopyWithImpl<$Res>;
  $Res call({String cityStr});
}

class _$FetchWeatherWithQueryCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res>
    implements $FetchWeatherWithQueryCopyWith<$Res> {
  _$FetchWeatherWithQueryCopyWithImpl(
      FetchWeatherWithQuery _value, $Res Function(FetchWeatherWithQuery) _then)
      : super(_value, (v) => _then(v as FetchWeatherWithQuery));

  @override
  FetchWeatherWithQuery get _value => super._value as FetchWeatherWithQuery;

  @override
  $Res call({
    Object cityStr = freezed,
  }) {
    return _then(FetchWeatherWithQuery(
      cityStr == freezed ? _value.cityStr : cityStr as String,
    ));
  }
}

class _$FetchWeatherWithQuery
    with DiagnosticableTreeMixin
    implements FetchWeatherWithQuery {
  const _$FetchWeatherWithQuery(this.cityStr) : assert(cityStr != null);

  @override
  final String cityStr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherEvent.fetchWeatherForLocationWithQuery(cityStr: $cityStr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'WeatherEvent.fetchWeatherForLocationWithQuery'))
      ..add(DiagnosticsProperty('cityStr', cityStr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchWeatherWithQuery &&
            (identical(other.cityStr, cityStr) ||
                const DeepCollectionEquality().equals(other.cityStr, cityStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cityStr);

  @override
  $FetchWeatherWithQueryCopyWith<FetchWeatherWithQuery> get copyWith =>
      _$FetchWeatherWithQueryCopyWithImpl<FetchWeatherWithQuery>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cityChanged(String cityStr),
    @required Result newSearch(),
    @required Result loadFromStorage(),
    @required Result fetchWeatherForLocationWithQuery(String cityStr),
    @required
        Result fetchWeatherForLocationWithLattLong(double latt, double long),
    @required Result refreshWeatherForLocation(String cityStr),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return fetchWeatherForLocationWithQuery(cityStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result loadFromStorage(),
    Result fetchWeatherForLocationWithQuery(String cityStr),
    Result fetchWeatherForLocationWithLattLong(double latt, double long),
    Result refreshWeatherForLocation(String cityStr),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchWeatherForLocationWithQuery != null) {
      return fetchWeatherForLocationWithQuery(cityStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cityChanged(CityChanged value),
    @required Result newSearch(NewSearch value),
    @required Result loadFromStorage(LoadFromStorage value),
    @required
        Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    @required
        Result fetchWeatherForLocationWithLattLong(
            FetchWeatherWithLattLong value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return fetchWeatherForLocationWithQuery(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result loadFromStorage(LoadFromStorage value),
    Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    Result fetchWeatherForLocationWithLattLong(FetchWeatherWithLattLong value),
    Result refreshWeatherForLocation(RefreshWeather value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchWeatherForLocationWithQuery != null) {
      return fetchWeatherForLocationWithQuery(this);
    }
    return orElse();
  }
}

abstract class FetchWeatherWithQuery implements WeatherEvent {
  const factory FetchWeatherWithQuery(String cityStr) = _$FetchWeatherWithQuery;

  String get cityStr;
  $FetchWeatherWithQueryCopyWith<FetchWeatherWithQuery> get copyWith;
}

abstract class $FetchWeatherWithLattLongCopyWith<$Res> {
  factory $FetchWeatherWithLattLongCopyWith(FetchWeatherWithLattLong value,
          $Res Function(FetchWeatherWithLattLong) then) =
      _$FetchWeatherWithLattLongCopyWithImpl<$Res>;
  $Res call({double latt, double long});
}

class _$FetchWeatherWithLattLongCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res>
    implements $FetchWeatherWithLattLongCopyWith<$Res> {
  _$FetchWeatherWithLattLongCopyWithImpl(FetchWeatherWithLattLong _value,
      $Res Function(FetchWeatherWithLattLong) _then)
      : super(_value, (v) => _then(v as FetchWeatherWithLattLong));

  @override
  FetchWeatherWithLattLong get _value =>
      super._value as FetchWeatherWithLattLong;

  @override
  $Res call({
    Object latt = freezed,
    Object long = freezed,
  }) {
    return _then(FetchWeatherWithLattLong(
      latt: latt == freezed ? _value.latt : latt as double,
      long: long == freezed ? _value.long : long as double,
    ));
  }
}

class _$FetchWeatherWithLattLong
    with DiagnosticableTreeMixin
    implements FetchWeatherWithLattLong {
  const _$FetchWeatherWithLattLong({this.latt, this.long});

  @override
  final double latt;
  @override
  final double long;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherEvent.fetchWeatherForLocationWithLattLong(latt: $latt, long: $long)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'WeatherEvent.fetchWeatherForLocationWithLattLong'))
      ..add(DiagnosticsProperty('latt', latt))
      ..add(DiagnosticsProperty('long', long));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchWeatherWithLattLong &&
            (identical(other.latt, latt) ||
                const DeepCollectionEquality().equals(other.latt, latt)) &&
            (identical(other.long, long) ||
                const DeepCollectionEquality().equals(other.long, long)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latt) ^
      const DeepCollectionEquality().hash(long);

  @override
  $FetchWeatherWithLattLongCopyWith<FetchWeatherWithLattLong> get copyWith =>
      _$FetchWeatherWithLattLongCopyWithImpl<FetchWeatherWithLattLong>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cityChanged(String cityStr),
    @required Result newSearch(),
    @required Result loadFromStorage(),
    @required Result fetchWeatherForLocationWithQuery(String cityStr),
    @required
        Result fetchWeatherForLocationWithLattLong(double latt, double long),
    @required Result refreshWeatherForLocation(String cityStr),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return fetchWeatherForLocationWithLattLong(latt, long);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result loadFromStorage(),
    Result fetchWeatherForLocationWithQuery(String cityStr),
    Result fetchWeatherForLocationWithLattLong(double latt, double long),
    Result refreshWeatherForLocation(String cityStr),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchWeatherForLocationWithLattLong != null) {
      return fetchWeatherForLocationWithLattLong(latt, long);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cityChanged(CityChanged value),
    @required Result newSearch(NewSearch value),
    @required Result loadFromStorage(LoadFromStorage value),
    @required
        Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    @required
        Result fetchWeatherForLocationWithLattLong(
            FetchWeatherWithLattLong value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return fetchWeatherForLocationWithLattLong(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result loadFromStorage(LoadFromStorage value),
    Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    Result fetchWeatherForLocationWithLattLong(FetchWeatherWithLattLong value),
    Result refreshWeatherForLocation(RefreshWeather value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchWeatherForLocationWithLattLong != null) {
      return fetchWeatherForLocationWithLattLong(this);
    }
    return orElse();
  }
}

abstract class FetchWeatherWithLattLong implements WeatherEvent {
  const factory FetchWeatherWithLattLong({double latt, double long}) =
      _$FetchWeatherWithLattLong;

  double get latt;
  double get long;
  $FetchWeatherWithLattLongCopyWith<FetchWeatherWithLattLong> get copyWith;
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
    @required Result loadFromStorage(),
    @required Result fetchWeatherForLocationWithQuery(String cityStr),
    @required
        Result fetchWeatherForLocationWithLattLong(double latt, double long),
    @required Result refreshWeatherForLocation(String cityStr),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return refreshWeatherForLocation(cityStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cityChanged(String cityStr),
    Result newSearch(),
    Result loadFromStorage(),
    Result fetchWeatherForLocationWithQuery(String cityStr),
    Result fetchWeatherForLocationWithLattLong(double latt, double long),
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
    @required Result loadFromStorage(LoadFromStorage value),
    @required
        Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    @required
        Result fetchWeatherForLocationWithLattLong(
            FetchWeatherWithLattLong value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(cityChanged != null);
    assert(newSearch != null);
    assert(loadFromStorage != null);
    assert(fetchWeatherForLocationWithQuery != null);
    assert(fetchWeatherForLocationWithLattLong != null);
    assert(refreshWeatherForLocation != null);
    return refreshWeatherForLocation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cityChanged(CityChanged value),
    Result newSearch(NewSearch value),
    Result loadFromStorage(LoadFromStorage value),
    Result fetchWeatherForLocationWithQuery(FetchWeatherWithQuery value),
    Result fetchWeatherForLocationWithLattLong(FetchWeatherWithLattLong value),
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
