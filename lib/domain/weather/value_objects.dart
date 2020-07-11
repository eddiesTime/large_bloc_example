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
