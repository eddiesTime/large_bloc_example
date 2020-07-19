import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_bloc_example/domain/authentication/auth_failure.dart';
import 'package:flutter_bloc_example/domain/authentication/value_objects.dart';
import 'package:flutter_bloc_example/infrastructure/authentication/firebase_auth_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthFacade extends Mock implements FirebaseAuthFacade {}

void main() {
  group('SignInFormBloc', () {
    FirebaseAuthFacade _authFacade;
    SignInFormBloc _signInFormBloc;
    final SignInFormState _initial = SignInFormState.initial();

    setUp(() {
      _authFacade = MockAuthFacade();
      _signInFormBloc = SignInFormBloc(_authFacade);
    });

    // Initial state
    test('initial state is SignInFormState.initial()', () {
      expect(_signInFormBloc.state.emailAddress, _initial.emailAddress);
      expect(_signInFormBloc.state.password, _initial.password);
      expect(
          _signInFormBloc.state.showErrorMessages, _initial.showErrorMessages);
      expect(_signInFormBloc.state.isSubmitting, _initial.isSubmitting);
      expect(_signInFormBloc.state.authFailureOrSuccessOption,
          _initial.authFailureOrSuccessOption);
    });

    // emailChanged
    test(
        'should check whether state is yielded correctly for emailChanged() event',
        () async {
      _signInFormBloc.add(const EmailChanged('Foo'));
      await emitsExactly(_signInFormBloc, [
        _signInFormBloc.state.copyWith(
          emailAddress: EmailAddress('Foo'),
          authFailureOrSuccessOption: none(),
        )
      ]);
    });
    // passwordChanged
    test(
        'should check whether state is yielded correctly for passwordChanged() event',
        () async {
      _signInFormBloc.add(const PasswordChanged('Foo'));
      await emitsExactly(_signInFormBloc, [
        _signInFormBloc.state.copyWith(
          password: Password('Foo'),
          authFailureOrSuccessOption: none(),
        )
      ]);
    });
    // registerWithEmailAndPasswordPressed
    test(
        'should check whether state is yielded correctly for registerWithEmailAndPasswordPressed() event for invalid email and failure case',
        () async {
      final EmailAddress _mockEmail = EmailAddress('Foo');
      final Password _mockPassword = Password('FooBar123');

      _signInFormBloc.add(const EmailChanged('Foo'));
      _signInFormBloc.add(const PasswordChanged('FooBar123'));
      _signInFormBloc.add(const RegisterWithEmailAndPasswordPressed());

      await emitsExactly(
        _signInFormBloc,
        [
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: none(),
          )
        ],
      );
      expect(_mockEmail.isValid(), isFalse);
      expect(_mockPassword.isValid(), isTrue);
    });
    test(
        'should check whether state is yielded correctly for registerWithEmailAndPasswordPressed() event for invalid password and failure case',
        () async {
      final EmailAddress _mockEmail = EmailAddress('foo.bar@test.com');
      final Password _mockPassword = Password('Foo');

      _signInFormBloc.add(const EmailChanged('foo.bar@test.com'));
      _signInFormBloc.add(const PasswordChanged('Foo'));
      _signInFormBloc.add(const RegisterWithEmailAndPasswordPressed());

      await emitsExactly(
        _signInFormBloc,
        [
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: none(),
          )
        ],
      );
      expect(_mockEmail.isValid(), isTrue);
      expect(_mockPassword.isValid(), isFalse);
    });
    test(
        'should check whether state is yielded correctly for registerWithEmailAndPasswordPressed() event for valid email & password and failure case',
        () async {
      final EmailAddress _mockEmail = EmailAddress('foo.bar@test.com');
      final Password _mockPassword = Password('FooBar123');
      when(_authFacade.registerWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword))
          .thenAnswer(
              (_) => Future.value(const Left(AuthFailure.emailAlreadyInUse())));
      _signInFormBloc.add(const EmailChanged('foo.bar@test.com'));
      _signInFormBloc.add(const PasswordChanged('FooBar123'));
      _signInFormBloc.add(const RegisterWithEmailAndPasswordPressed());

      await emitsExactly(
        _signInFormBloc,
        [
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption:
                some(const Left(AuthFailure.emailAlreadyInUse())),
          )
        ],
      );
      expect(_mockEmail.isValid(), isTrue);
      expect(_mockPassword.isValid(), isTrue);
    });
    test(
        'should check whether state is yielded correctly for registerWithEmailAndPasswordPressed() event for valid email & password and success case',
        () async {
      final EmailAddress _mockEmail = EmailAddress('foo.bar@test.com');
      final Password _mockPassword = Password('FooBar123');
      when(_authFacade.registerWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword))
          .thenAnswer((_) => Future.value(const Right(unit)));
      _signInFormBloc.add(const EmailChanged('foo.bar@test.com'));
      _signInFormBloc.add(const PasswordChanged('FooBar123'));
      _signInFormBloc.add(const RegisterWithEmailAndPasswordPressed());

      await emitsExactly(
        _signInFormBloc,
        [
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: some(
              const Right(unit),
            ),
          )
        ],
      );
      expect(_mockEmail.isValid(), isTrue);
      expect(_mockPassword.isValid(), isTrue);
    });
    // signInWithEmailAndPasswordPressed
    test(
        'should check whether state is yielded correctly for SignInWithEmailAndPasswordPressed() event for invalid email and failure case',
        () async {
      final EmailAddress _mockEmail = EmailAddress('Foo');
      final Password _mockPassword = Password('FooBar123');

      _signInFormBloc.add(const EmailChanged('Foo'));
      _signInFormBloc.add(const PasswordChanged('FooBar123'));
      _signInFormBloc.add(const SignInWithEmailAndPasswordPressed());

      await emitsExactly(
        _signInFormBloc,
        [
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: none(),
          )
        ],
      );
      expect(_mockEmail.isValid(), isFalse);
      expect(_mockPassword.isValid(), isTrue);
    });
    test(
        'should check whether state is yielded correctly for SignInWithEmailAndPasswordPressed() event for invalid password and failure case',
        () async {
      final EmailAddress _mockEmail = EmailAddress('foo.bar@test.com');
      final Password _mockPassword = Password('Foo');

      _signInFormBloc.add(const EmailChanged('foo.bar@test.com'));
      _signInFormBloc.add(const PasswordChanged('Foo'));
      _signInFormBloc.add(const SignInWithEmailAndPasswordPressed());

      await emitsExactly(
        _signInFormBloc,
        [
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: none(),
          )
        ],
      );
      expect(_mockEmail.isValid(), isTrue);
      expect(_mockPassword.isValid(), isFalse);
    });
    test(
        'should check whether state is yielded correctly for SignInWithEmailAndPasswordPressed() event for valid email & password and failure case',
        () async {
      final EmailAddress _mockEmail = EmailAddress('foo.bar@test.com');
      final Password _mockPassword = Password('FooBar123');
      when(_authFacade.signInWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword))
          .thenAnswer((_) => Future.value(
              const Left(AuthFailure.invalidEmailAndPasswordCombination())));
      _signInFormBloc.add(const EmailChanged('foo.bar@test.com'));
      _signInFormBloc.add(const PasswordChanged('FooBar123'));
      _signInFormBloc.add(const SignInWithEmailAndPasswordPressed());

      await emitsExactly(
        _signInFormBloc,
        [
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: some(
                const Left(AuthFailure.invalidEmailAndPasswordCombination())),
          )
        ],
      );
      expect(_mockEmail.isValid(), isTrue);
      expect(_mockPassword.isValid(), isTrue);
    });
    test(
        'should check whether state is yielded correctly for SignInWithEmailAndPasswordPressed() event for valid email & password and success case',
        () async {
      final EmailAddress _mockEmail = EmailAddress('foo.bar@test.com');
      final Password _mockPassword = Password('FooBar123');
      when(_authFacade.signInWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword))
          .thenAnswer((_) => Future.value(const Right(unit)));
      _signInFormBloc.add(const EmailChanged('foo.bar@test.com'));
      _signInFormBloc.add(const PasswordChanged('FooBar123'));
      _signInFormBloc.add(const SignInWithEmailAndPasswordPressed());

      await emitsExactly(
        _signInFormBloc,
        [
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
          _signInFormBloc.state.copyWith(
            emailAddress: _mockEmail,
            password: _mockPassword,
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: some(
              const Right(unit),
            ),
          )
        ],
      );
      expect(_mockEmail.isValid(), isTrue);
      expect(_mockPassword.isValid(), isTrue);
    });
    // signInWithGooglePressed
    test(
        'should check whether state is yielded correctly for signInWithGooglePressed() event and failure case',
        () async {
      _signInFormBloc.add(const SignInWithGooglePressed());
      when(_authFacade.signInWithGoogle()).thenAnswer(
        (_) => Future.value(
          const Left(AuthFailure.serverError()),
        ),
      );
      await emitsExactly(_signInFormBloc, [
        _signInFormBloc.state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        _signInFormBloc.state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(
            const Left(AuthFailure.serverError()),
          ),
        ),
      ]);
    });
    test(
        'should check whether state is yielded correctly for signInWithGooglePressed() event and success case',
        () async {
      _signInFormBloc.add(const SignInWithGooglePressed());
      when(_authFacade.signInWithGoogle()).thenAnswer(
        (_) => Future.value(
          const Right(unit),
        ),
      );
      await emitsExactly(_signInFormBloc, [
        _signInFormBloc.state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        _signInFormBloc.state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(
            const Right(unit),
          ),
        ),
      ]);
    });
  });
}
