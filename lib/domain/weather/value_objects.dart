import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/domain/core/value_failure.dart';
import 'package:flutter_bloc_example/domain/core/value_object.dart';
import 'package:flutter_bloc_example/domain/core/value_validators.dart';

class City extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const City._(this.value);

  factory City(String input) {
    assert(input != null);
    return City._(
      validateSingleLine(input)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateCityString),
    );
  }
}

class LastUpdated extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;
  const LastUpdated._(this.value);

  factory LastUpdated(DateTime input) {
    assert(input != null);
    return LastUpdated._(right(input));
  }
}

class WeatherResponse extends ValueObject<WeatherResponse> {
  @override
  final Either<ValueFailure<WeatherResponse>, WeatherResponse> value;

  const WeatherResponse._(this.value);

  factory WeatherResponse(WeatherResponse input) {
    assert(input != null);
    return WeatherResponse._(right(input));
  }
}
