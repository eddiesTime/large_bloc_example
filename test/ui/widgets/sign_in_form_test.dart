import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_example/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_bloc_example/domain/authentication/value_objects.dart';
import 'package:flutter_bloc_example/presentation/authentication/widgets/sign_in_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSignInFormBloc extends MockBloc<SignInFormState>
    implements SignInFormBloc {}

class MockAuthBloc extends MockBloc<AuthenticationState>
    implements AuthenticationBloc {}

void main() {
  SignInFormBloc _signInFormBloc;
  group('Sign In Form', () {
    setUp(() async {
      _signInFormBloc = MockSignInFormBloc();
    });

    testWidgets('renders correctly for initial state',
        (WidgetTester tester) async {
      when(_signInFormBloc.state).thenAnswer((_) => SignInFormState.initial());
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [BlocProvider.value(value: _signInFormBloc)],
              child: const Center(
                key: Key('__AUTHENTICATION_PAGE_CENTER__'),
                child: SignInForm(),
              ),
            ),
          ),
        ),
      );
      expect(find.byKey(const Key('__Sign_In_Form__')), findsOneWidget);
      expect(
          find.byKey(const Key('__Sign_In_Form_List_View__')), findsOneWidget);
      expect(
          find.byKey(const Key('__Flutter_Logo_Container__')), findsOneWidget);
      expect(
          find.byKey(const Key('__Email_Text_Form_Field__')), findsOneWidget);
      expect(find.byKey(const Key('__Password_Text_Form_Field__')),
          findsOneWidget);
      expect(find.byKey(const Key('__Sign_In_Form_Sign_In_Button__')),
          findsOneWidget);
      expect(find.byKey(const Key('__Sign_In_Form_Register_Button__')),
          findsOneWidget);
      expect(
          find.byKey(const Key('__Sign_In_Form_Sign_In_With_Google_Button__')),
          findsOneWidget);
    });

    test('should check whether constructor is working correctly', () {
      expect(
          const SignInForm(
            key: Key('__Constructor__'),
          ),
          isA<SignInForm>());
    });

    testWidgets(
        'should check whether onChanged for email field works correctly',
        (WidgetTester tester) async {
      when(_signInFormBloc.state).thenAnswer((_) => SignInFormState.initial());
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [BlocProvider.value(value: _signInFormBloc)],
              child: const Center(
                key: Key('__AUTHENTICATION_PAGE_CENTER__'),
                child: SignInForm(),
              ),
            ),
          ),
        ),
      );
      await tester.enterText(find.byKey(const Key('__Email_Text_Form_Field__')),
          'foo.bar@test.com');
      await tester.pumpAndSettle();
      verify(_signInFormBloc
              .add(const SignInFormEvent.emailChanged('foo.bar@test.com')))
          .called(1);
    });
    testWidgets(
        'should check whether validator for email field works correctly',
        (WidgetTester tester) async {
      when(_signInFormBloc.state).thenAnswer((_) => SignInFormState.initial());
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [BlocProvider.value(value: _signInFormBloc)],
              child: const Center(
                key: Key('__AUTHENTICATION_PAGE_CENTER__'),
                child: SignInForm(),
              ),
            ),
          ),
        ),
      );
      expect(_signInFormBloc.state.emailAddress.value.isLeft(), isTrue);
      await tester.enterText(find.byKey(const Key('__Email_Text_Form_Field__')),
          'foo.bar@test.com');
      await tester.pumpAndSettle();
      when(_signInFormBloc.state)
          .thenAnswer((_) => SignInFormState.initial().copyWith(
                emailAddress: EmailAddress('foo.bar@test.com'),
                authFailureOrSuccessOption: none(),
              ));
      verify(_signInFormBloc
              .add(const SignInFormEvent.emailChanged('foo.bar@test.com')))
          .called(1);
      expect(
          _signInFormBloc.state.emailAddress.value.fold(
            (f) => f.maybeMap(
              invalidEmail: (_) => 'Invalid email',
              orElse: () => null,
            ),
            (_) => null,
          ),
          isNull);
      when(_signInFormBloc.state)
          .thenAnswer((_) => SignInFormState.initial().copyWith(
                emailAddress: EmailAddress('foo'),
                authFailureOrSuccessOption: none(),
              ));
      expect(
          _signInFormBloc.state.emailAddress.value.fold(
            (f) => f.maybeMap(
              invalidEmail: (_) => 'Invalid email',
              orElse: () => null,
            ),
            (_) => null,
          ),
          'Invalid email');
    });
    testWidgets(
        'should check whether onChanged for password field works correctly',
        (WidgetTester tester) async {
      when(_signInFormBloc.state).thenAnswer((_) => SignInFormState.initial());
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [BlocProvider.value(value: _signInFormBloc)],
              child: const Center(
                key: Key('__AUTHENTICATION_PAGE_CENTER__'),
                child: SignInForm(),
              ),
            ),
          ),
        ),
      );
      await tester.enterText(
          find.byKey(const Key('__Password_Text_Form_Field__')), 'foobar123');
      await tester.pumpAndSettle();
      verify(_signInFormBloc
              .add(const SignInFormEvent.passwordChanged('foobar123')))
          .called(1);
    });
  });
}
