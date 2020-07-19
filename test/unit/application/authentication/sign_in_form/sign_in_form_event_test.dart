import 'package:flutter_bloc_example/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Sign In Form Event', () {
    test(
        'should check whether SignInFormEvent.emailChanged().toString() is working correctly',
        () {
      expect(
        const SignInFormEvent.emailChanged('Foo').toString(),
        'SignInFormEvent.emailChanged(emailStr: Foo)',
      );
    });
    test(
        'should check whether SignInFormEvent.passwordChanged().toString() is working correctly',
        () {
      expect(
        const SignInFormEvent.passwordChanged('Foo').toString(),
        'SignInFormEvent.passwordChanged(passwordStr: Foo)',
      );
    });
    test(
        'should check whether SignInFormEvent.registerWithEmailAndPasswordPressed().toString() is working correctly',
        () {
      expect(
        const SignInFormEvent.registerWithEmailAndPasswordPressed().toString(),
        'SignInFormEvent.registerWithEmailAndPasswordPressed()',
      );
    });
    test(
        'should check whether SignInFormEvent.signInWithEmailAndPasswordPressed().toString() is working correctly',
        () {
      expect(
        const SignInFormEvent.signInWithEmailAndPasswordPressed().toString(),
        'SignInFormEvent.signInWithEmailAndPasswordPressed()',
      );
    });
    test(
        'should check whether SignInFormEvent.signInWithGooglePressed().toString() is working correctly',
        () {
      expect(
        const SignInFormEvent.signInWithGooglePressed().toString(),
        'SignInFormEvent.signInWithGooglePressed()',
      );
    });
  });
}
