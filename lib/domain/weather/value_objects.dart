import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/domain/core/value_failure.dart';
import 'package:flutter_bloc_example/domain/core/value_object.dart';
import 'package:flutter_bloc_example/domain/core/value_validators.dart';

class City extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory City(String input) {
    assert(input != null);
    return City._(
      validateSingleLine(input)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateCityString),
    );
  }
  const City._(this.value);
}

class LastUpdated extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;

  factory LastUpdated(DateTime input) {
    assert(input != null);
    return LastUpdated._(right(input));
  }
  const LastUpdated._(this.value);
}

class WeatherResponse extends ValueObject<WeatherResponse> {
  @override
  final Either<ValueFailure<WeatherResponse>, WeatherResponse> value;

  factory WeatherResponse(WeatherResponse input) {
    assert(input != null);
    return WeatherResponse._(right(input));
  }
  const WeatherResponse._(this.value);
}
