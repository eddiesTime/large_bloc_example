import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_example/domain/authentication/user_entity.dart';
import 'package:flutter_bloc_example/domain/authentication/value_objects.dart';
import 'package:flutter_bloc_example/domain/core/value_object.dart';
import 'package:flutter_bloc_example/infrastructure/authentication/firebase_auth_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthFacade extends Mock implements FirebaseAuthFacade {}

void main() {
  group('Authentication Bloc', () {
    FirebaseAuthFacade _authFacade;
    AuthenticationBloc _authBloc;
    const AuthenticationState _initial = AuthenticationState.initial();

    setUp(() {
      _authFacade = MockAuthFacade();
      _authBloc = AuthenticationBloc(_authFacade);
    });

    // Initial state
    test('initial state is Authentication.initial()', () {
      expect(_authBloc.state, _initial);
    });

    // authCheckRequested
    test(
        'should check whether state is yielded correctly for authCheckRequested() event for failure case',
        () async {
      when(_authFacade.getSignedInUser())
          .thenAnswer((_) => Future.value(none()));
      _authBloc.add(const AuthCheckRequested());
      await emitsExactly(
          _authBloc, [const AuthenticationState.unauthenticated()]);
    });
    test(
        'should check whether state is yielded correctly for authCheckRequested() event for success case',
        () async {
      final UserEntity _mockUser = UserEntity(
          id: UniqueId(),
          name: StringSingleLine('Foo Bar'),
          emailAddress: EmailAddress('foo.bar@test.com'));
      when(_authFacade.getSignedInUser())
          .thenAnswer((_) => Future.value(some(_mockUser)));
      _authBloc.add(const AuthCheckRequested());
      await emitsExactly(
          _authBloc, [AuthenticationState.authenticated(_mockUser)]);
    });
    // signedOut
    test('should check whether state is yielded correctly for signOut() event',
        () async {
      _authBloc.add(const SignedOut());
      await emitsExactly(
          _authBloc, [const AuthenticationState.unauthenticated()]);
    });
  });
}
