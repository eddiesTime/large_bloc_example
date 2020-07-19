import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_bloc_example/domain/authentication/auth_failure.dart';
import 'package:flutter_bloc_example/domain/authentication/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Sign In Form State', () {
    test('should check whether SignInFormState.initial() is working correctly',
        () {
      final SignInFormState _initial = SignInFormState.initial();
      expect(_initial.emailAddress, EmailAddress(''));
      expect(_initial.password, Password(''));
      expect(_initial.showErrorMessages, false);
      expect(_initial.isSubmitting, false);
      expect(_initial.authFailureOrSuccessOption, none());
    });
    test('should check whether factory constructor is working correctly', () {
      final EmailAddress _mockEmail = EmailAddress('mocker@mock.com');
      final Password _mockpassword = Password('FooBar');
      final Option<Either<AuthFailure, Unit>> _mockOption =
          some(const Right(unit));
      final SignInFormState _mockState = SignInFormState(
          authFailureOrSuccessOption: _mockOption,
          emailAddress: _mockEmail,
          password: _mockpassword,
          isSubmitting: true,
          showErrorMessages: true);
      expect(_mockState.emailAddress, _mockEmail);
      expect(_mockState.password, _mockpassword);
      expect(_mockState.showErrorMessages, true);
      expect(_mockState.isSubmitting, true);
      expect(_mockState.authFailureOrSuccessOption, _mockOption);
    });
  });
}
