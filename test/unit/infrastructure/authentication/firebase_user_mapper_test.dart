import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc_example/domain/authentication/user_entity.dart';
import 'package:flutter_bloc_example/domain/authentication/value_objects.dart';
import 'package:flutter_bloc_example/domain/core/value_object.dart';
import 'package:flutter_bloc_example/infrastructure/authentication/firebase_user_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockFirebaseUserMapper extends Mock implements FirebaseUserMapper {}

void main() {
  FirebaseUser _user;
  FirebaseUserMapper _userMapper;
  group('Firebase User Mapper', () {
    setUp(() {
      _user = MockFirebaseUser();
      _userMapper = MockFirebaseUserMapper();
    });
    test(
        'should check whether toDomain() is working correctly for existing user',
        () {
      final UserEntity _mockUser = UserEntity(
          id: UniqueId.fromUniqueString('123'),
          emailAddress: EmailAddress('foo.bar@test.com'),
          name: StringSingleLine('Foo'));
      when(_userMapper.toDomain(_user)).thenReturn(_mockUser);
      expect(_userMapper.toDomain(_user), _mockUser);
    });
    test(
        'should check whether toDomain() is working correctly for non-existent user',
        () {
      expect(_userMapper.toDomain(null), isNull);
    });
  });
}
