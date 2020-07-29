import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_bloc_example/presentation/authentication/widgets/sign_in_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSignInFormBloc extends MockBloc<SignInFormState>
    implements SignInFormBloc {}

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
  });
}
