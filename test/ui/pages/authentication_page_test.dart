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
  group('Authentication Test Page', () {
    SignInFormBloc _signInFormBloc;
    setUp(() async {
      _signInFormBloc = MockSignInFormBloc();
    });

    testWidgets('renders Authentication Page correctly',
        (WidgetTester tester) async {
      when(_signInFormBloc.state).thenAnswer((_) => SignInFormState.initial());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: _signInFormBloc,
            child: const Center(
                key: Key('__AUTHENTICATION_PAGE_CENTER__'),
                child: SignInForm()),
          ),
        ),
      ));
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byKey(const Key('__AUTHENTICATION_PAGE_CENTER__')),
          findsOneWidget);
      expect(find.byType(SignInForm), findsOneWidget);
    });
  });
}
