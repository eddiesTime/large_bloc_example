import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc_example/domain/authentication/user_entity.dart';
import 'package:flutter_bloc_example/domain/authentication/value_objects.dart';
import 'package:flutter_bloc_example/domain/core/value_object.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseUserMapper {
  UserEntity toDomain(FirebaseUser _) {
    return _ == null
        ? null
        : UserEntity(
            id: UniqueId.fromUniqueString(_.uid),
            name: StringSingleLine(_.displayName ?? _.email.split('@').first),
            emailAddress: EmailAddress(_.email),
          );
  }
}
