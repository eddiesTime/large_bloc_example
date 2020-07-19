import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_example/domain/authentication/user_entity.dart';
import 'package:flutter_bloc_example/domain/authentication/value_objects.dart';
import 'package:flutter_bloc_example/domain/core/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Authentication State', () {
    test(
        'should check whether AuthenticationState.initial().toString() is working correctly',
        () {
      expect(const AuthenticationState.initial().toString(),
          'AuthenticationState.initial()');
    });
    test(
        'should check whether AuthenticationState.unauthenticated().toString() is working correctly',
        () {
      expect(const AuthenticationState.unauthenticated().toString(),
          'AuthenticationState.unauthenticated()');
    });
    test(
        'should check whether AuthenticationState.authenticated().toString() is working correctly',
        () {
      final UserEntity _mockUser = UserEntity(
          id: UniqueId(),
          emailAddress: EmailAddress('foo.bar@test.com'),
          name: StringSingleLine('Foo Bar'));
      expect(AuthenticationState.authenticated(_mockUser).toString(),
          'AuthenticationState.authenticated(user: ${_mockUser.toString()})');
    });
  });
}
