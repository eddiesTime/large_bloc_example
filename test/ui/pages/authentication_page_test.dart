import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_bloc_example/domain/authentication/i_auth_facade.dart';
import 'package:flutter_bloc_example/infrastructure/authentication/firebase_auth_facade.dart';
import 'package:flutter_bloc_example/presentation/authentication/pages/authentication_page.dart';
import 'package:flutter_bloc_example/presentation/authentication/widgets/sign_in_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

GetIt getIt = GetIt.instance;

class MockSignInFormBloc extends MockBloc<SignInFormState>
    implements SignInFormBloc {}

class MockAuthFacade extends Mock implements FirebaseAuthFacade {}

void main() {
  group('Authentication Test Page', () {
    SignInFormBloc _signInFormBloc;
    FirebaseAuthFacade _authFacade;
    setUp(() async {
      _signInFormBloc = MockSignInFormBloc();
      _authFacade = MockAuthFacade();
      getIt.registerLazySingleton<IAuthFacade>(() => _authFacade);
      getIt.registerLazySingleton<SignInFormBloc>(
          () => SignInFormBloc(_authFacade));
    });

    testWidgets('renders Authentication Page correctly',
        (WidgetTester tester) async {
      when(_signInFormBloc.state).thenAnswer((_) => SignInFormState.initial());
      await tester.pumpWidget(
        MaterialApp(
          home: AuthenticationPage(),
        ),
      );
      expect(find.byType(Scaffold), findsOneWidget);
      expect(
          find.byKey(
            const Key('__Auth_Page_BlocProvider<SignInFormBloc>__'),
          ),
          findsOneWidget);
      expect(find.byKey(const Key('__AUTHENTICATION_PAGE_CENTER__')),
          findsOneWidget);
      expect(find.byType(SignInForm), findsOneWidget);
    });
  });
}
