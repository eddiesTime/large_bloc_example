// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'weather_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WeatherFailureTearOff {
  const _$WeatherFailureTearOff();

  NotALocation notALocation() {
    return const NotALocation();
  }

  UnableToRefresh unableToRefresh() {
    return const UnableToRefresh();
  }
}

// ignore: unused_element
const $WeatherFailure = _$WeatherFailureTearOff();

mixin _$WeatherFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notALocation(),
    @required Result unableToRefresh(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notALocation(),
    Result unableToRefresh(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notALocation(NotALocation value),
    @required Result unableToRefresh(UnableToRefresh value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notALocation(NotALocation value),
    Result unableToRefresh(UnableToRefresh value),
    @required Result orElse(),
  });
}

abstract class $WeatherFailureCopyWith<$Res> {
  factory $WeatherFailureCopyWith(
          WeatherFailure value, $Res Function(WeatherFailure) then) =
      _$WeatherFailureCopyWithImpl<$Res>;
}

class _$WeatherFailureCopyWithImpl<$Res>
    implements $WeatherFailureCopyWith<$Res> {
  _$WeatherFailureCopyWithImpl(this._value, this._then);

  final WeatherFailure _value;
  // ignore: unused_field
  final $Res Function(WeatherFailure) _then;
}

abstract class $NotALocationCopyWith<$Res> {
  factory $NotALocationCopyWith(
          NotALocation value, $Res Function(NotALocation) then) =
      _$NotALocationCopyWithImpl<$Res>;
}

class _$NotALocationCopyWithImpl<$Res>
    extends _$WeatherFailureCopyWithImpl<$Res>
    implements $NotALocationCopyWith<$Res> {
  _$NotALocationCopyWithImpl(
      NotALocation _value, $Res Function(NotALocation) _then)
      : super(_value, (v) => _then(v as NotALocation));

  @override
  NotALocation get _value => super._value as NotALocation;
}

class _$NotALocation implements NotALocation {
  const _$NotALocation();

  @override
  String toString() {
    return 'WeatherFailure.notALocation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotALocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notALocation(),
    @required Result unableToRefresh(),
  }) {
    assert(notALocation != null);
    assert(unableToRefresh != null);
    return notALocation();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notALocation(),
    Result unableToRefresh(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notALocation != null) {
      return notALocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notALocation(NotALocation value),
    @required Result unableToRefresh(UnableToRefresh value),
  }) {
    assert(notALocation != null);
    assert(unableToRefresh != null);
    return notALocation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notALocation(NotALocation value),
    Result unableToRefresh(UnableToRefresh value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notALocation != null) {
      return notALocation(this);
    }
    return orElse();
  }
}

abstract class NotALocation implements WeatherFailure {
  const factory NotALocation() = _$NotALocation;
}

abstract class $UnableToRefreshCopyWith<$Res> {
  factory $UnableToRefreshCopyWith(
          UnableToRefresh value, $Res Function(UnableToRefresh) then) =
      _$UnableToRefreshCopyWithImpl<$Res>;
}

class _$UnableToRefreshCopyWithImpl<$Res>
    extends _$WeatherFailureCopyWithImpl<$Res>
    implements $UnableToRefreshCopyWith<$Res> {
  _$UnableToRefreshCopyWithImpl(
      UnableToRefresh _value, $Res Function(UnableToRefresh) _then)
      : super(_value, (v) => _then(v as UnableToRefresh));

  @override
  UnableToRefresh get _value => super._value as UnableToRefresh;
}

class _$UnableToRefresh implements UnableToRefresh {
  const _$UnableToRefresh();

  @override
  String toString() {
    return 'WeatherFailure.unableToRefresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnableToRefresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notALocation(),
    @required Result unableToRefresh(),
  }) {
    assert(notALocation != null);
    assert(unableToRefresh != null);
    return unableToRefresh();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notALocation(),
    Result unableToRefresh(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unableToRefresh != null) {
      return unableToRefresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notALocation(NotALocation value),
    @required Result unableToRefresh(UnableToRefresh value),
  }) {
    assert(notALocation != null);
    assert(unableToRefresh != null);
    return unableToRefresh(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notALocation(NotALocation value),
    Result unableToRefresh(UnableToRefresh value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unableToRefresh != null) {
      return unableToRefresh(this);
    }
    return orElse();
  }
}

abstract class UnableToRefresh implements WeatherFailure {
  const factory UnableToRefresh() = _$UnableToRefresh;
}
