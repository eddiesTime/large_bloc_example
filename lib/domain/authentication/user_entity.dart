import 'package:flutter_bloc_example/domain/authentication/value_objects.dart';
import 'package:flutter_bloc_example/domain/core/entity.dart';
import 'package:flutter_bloc_example/domain/core/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity implements IEntity {
  const factory UserEntity({
    @required UniqueId id,
    @required StringSingleLine name,
    @required EmailAddress emailAddress,
  }) = _UserEntity;
}
