import 'package:dartz/dartz.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_example/domain/authentication/auth_failure.dart';
import 'package:flutter_bloc_example/domain/authentication/user_entity.dart';
import 'package:flutter_bloc_example/domain/authentication/value_objects.dart';
import 'package:flutter_bloc_example/infrastructure/authentication/firebase_auth_facade.dart';
import 'package:flutter_bloc_example/infrastructure/authentication/firebase_user_mapper.dart';
import 'package:flutter_bloc_example/infrastructure/logging/fimber_facade.dart';
import 'package:flutter_bloc_example/infrastructure/logging/i_logging_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

GetIt sl = GetIt.instance;

class MockLoggingFacade extends Mock implements ILoggingFacade<FimberLog> {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockFirebaseUserMapper extends Mock implements FirebaseUserMapper {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockGoogleAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockAuthCredential extends Mock implements AuthCredential {}

class MockAuthResult extends Mock implements AuthResult {}

class MockGoogleAuthProvider extends Mock implements GoogleAuthProvider {
  // final MockAuthCredential _credentials;
  static MockAuthCredential _credentials;

  MockGoogleAuthProvider(MockAuthCredential credentials) {
    _credentials = credentials;
  }
  @override
  static AuthCredential getCredential() {
    return _credentials;
  }
  // static AuthCredential getCredential() {
  //   return _credentials;
  // }
}

class MockUserEntity extends Mock implements UserEntity {}

void main() {
  sl.registerLazySingleton<ILoggingFacade<FimberLog>>(() => FimberFacade());
  group('Firebase Auth Facade', () {
    FirebaseAuthFacade _authFacade;
    FirebaseAuth _firebaseAuth;
    GoogleSignIn _googleSignIn;
    FirebaseUserMapper _firebaseUserMapper;
    FirebaseUser _mockUser;
    UserEntity _mockUserEntity;
    ILoggingFacade<FimberLog> _loggingFacade;
    GoogleSignInAccount _mockGoogleAccount;
    GoogleSignInAuthentication _mockGoogleAuthentication;
    GoogleAuthProvider _mockGoogleAuthProvider;
    MockAuthCredential _mockAuthCredential;
    AuthResult _mockAuthResult;
    final EmailAddress _mockEmail = EmailAddress('foo.bar@test.com');
    final Password _mockPassword = Password('FooBar123');
    final emailAddressStr = _mockEmail.value.getOrElse(() => 'INVALID EMAIL');
    final passwordStr = _mockPassword.value.getOrElse(() => 'INVALID PASSWORD');

    setUp(() {
      _firebaseAuth = MockFirebaseAuth();
      _googleSignIn = MockGoogleSignIn();
      _firebaseUserMapper = MockFirebaseUserMapper();
      _loggingFacade = MockLoggingFacade();
      _mockUser = MockFirebaseUser();
      _mockUserEntity = MockUserEntity();
      _authFacade = FirebaseAuthFacade(
        _firebaseAuth,
        _googleSignIn,
        _firebaseUserMapper,
        _loggingFacade,
      );
      _mockGoogleAccount = MockGoogleAccount();
      _mockGoogleAuthentication = MockGoogleSignInAuthentication();
      _mockAuthCredential = MockAuthCredential();
      _mockGoogleAuthProvider = MockGoogleAuthProvider(_mockAuthCredential);
      _mockAuthResult = MockAuthResult();
    });

    test(
        'should check whether getSignedInUser is working correctly for none case',
        () async {
      verify(_loggingFacade.createNamedLogger(name: 'Auth Facade')).called(1);
      when(_firebaseAuth.currentUser()).thenAnswer((_) => Future.value());
      expect(await _authFacade.getSignedInUser(), none());
    });
    test(
        'should check whether getSignedInUser is working correctly for some case',
        () async {
      verify(_loggingFacade.createNamedLogger(name: 'Auth Facade')).called(1);
      when(_firebaseUserMapper.toDomain(_mockUser))
          .thenAnswer((_) => _mockUserEntity);
      when(_firebaseAuth.currentUser())
          .thenAnswer((_) => Future.value(_mockUser));
      expect(await _authFacade.getSignedInUser(), some(_mockUserEntity));
    });
// REGISTER USER WITH EMAIL AND PASSWORD
    test(
        'should check wether registerWithEmailAndPassword is working correctly for success case',
        () async {
      /// Email Adresse übergeben
      /// Password übergeben
      /// fireBaseAuth answer with mock
      /// expect unit
      when(_firebaseAuth.createUserWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr))
          .thenAnswer((_) => Future.value());
      expect(
          await _authFacade.registerWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword),
          right(unit));
    });
    test(
        'should check wether registerWithEmailAndPassword is working correctly for failure case "Email Already In Use"',
        () async {
      /// firebase Auth
      /// throw PlatformException
      /// [e.code] == already in use
      when(_firebaseAuth.createUserWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr))
          .thenThrow(PlatformException(code: 'ERROR_EMAIL_ALREADY_IN_USE'));
      when(_loggingFacade.logError(
              logger: null, message: 'Register with email and password.'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
              logger: null, message: 'Get current user position'),
          throwsArgumentError);
      expect(
          await _authFacade.registerWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword),
          left(const AuthFailure.emailAlreadyInUse()));
    });
    test(
        'should check wether registerWithEmailAndPassword is working correctly for failure case "Server Error"',
        () async {
      when(_firebaseAuth.createUserWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr))
          .thenThrow(PlatformException(code: ''));
      when(_loggingFacade.logError(
              logger: null, message: 'Register with email and password.'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
              logger: null, message: 'Get current user position'),
          throwsArgumentError);
      expect(
          await _authFacade.registerWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword),
          left(const AuthFailure.serverError()));
    });
    // SIGN IN WITH EMAIL AND PASSWORD
    test(
        'should check wether signInWithEmailAndPassword is working correctly for success case',
        () async {});
    test(
        'should check wether signInWithEmailAndPassword is working correctly for failure case "Wrong Password"',
        () async {
      when(_loggingFacade.logError(
              logger: null, message: 'Register with email and password.'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
              logger: null, message: 'Sign in with email and password'),
          throwsArgumentError);
    });
    test(
        'should check wether signInWithEmailAndPassword is working correctly for failure case "User Not Found"',
        () async {
      when(_loggingFacade.logError(
              logger: null, message: 'Sign in with email and password'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
              logger: null, message: 'Sign in with email and password'),
          throwsArgumentError);
    });
    test(
        'should check wether signInWithEmailAndPassword is working correctly for failure case "Server Error"',
        () async {
      when(_loggingFacade.logError(
              logger: null, message: 'Sign in with email and password'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
              logger: null, message: 'Sign in with email and password'),
          throwsArgumentError);
    });
    // SIGN IN WITH GOOGLE
    test(
        'should check wether signInWithGoogle is working correctly for failure case "Canceled By User"',
        () async {
      when(_googleSignIn.signIn()).thenAnswer((_) => Future.value());
      expect(await _authFacade.signInWithGoogle(),
          left(const AuthFailure.cancelledByUser()));
    });
    // test(
    //     'should check wether signInWithGoogle is working correctly for success case',
    //     () async {
    //   when(_googleSignIn.signIn())
    //       .thenAnswer((_) => Future.value(_mockGoogleAccount));
    //   when(_mockGoogleAccount.authentication)
    //       .thenAnswer((_) => Future.value(_mockGoogleAuthentication));
    //   // when(MockGoogleAuthProvider.getCredential())
    //   //     .thenAnswer((_) => _mockAuthCredential);
    //   when(_firebaseAuth.signInWithCredential(_mockAuthCredential))
    //       .thenAnswer((_) => Future.value(_mockAuthResult));
    //   // expect(await _authFacade.signInWithGoogle(), right(unit));
    //   await _authFacade.signInWithGoogle();
    // });
    test(
        'should check wether signInWithGoogle is working correctly for failure case',
        () async {
      when(_googleSignIn.signIn()).thenThrow(PlatformException(code: ''));
      when(_loggingFacade.logError(
              logger: null, message: 'Sign in with Google'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
              logger: null, message: 'Sign in with Google'),
          throwsArgumentError);
    });
    // SIGN OUT
    test('should check wether signOut is working correctly for failure case',
        () async {
      when(_googleSignIn.signOut()).thenThrow(Exception());
      when(_loggingFacade.logError(logger: null, message: 'Logout'))
          .thenThrow(ArgumentError());
      expect(() => _loggingFacade.logError(logger: null, message: 'Logout'),
          throwsArgumentError);
    });
    test('should check wether signOut is working correctly for success case',
        () async {
      when(_googleSignIn.signOut()).thenAnswer((_) => Future.value());
      when(_firebaseAuth.signOut()).thenAnswer((_) => Future.value());
      await _authFacade.signOut();
      verify(_googleSignIn.signOut()).called(1);
      verify(_firebaseAuth.signOut()).called(1);
    });
  });
}
