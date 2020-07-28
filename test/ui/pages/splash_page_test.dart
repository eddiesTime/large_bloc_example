import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_example/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_bloc_example/application/blocs.dart';
import 'package:flutter_bloc_example/domain/authentication/user_entity.dart';
import 'package:flutter_bloc_example/presentation/splash/splash_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthBloc extends MockBloc<AuthenticationState>
    implements AuthenticationBloc {}

class MockSignInFormBloc extends MockBloc<SignInFormState>
    implements SignInFormBloc {}

class MockWeatherBloc extends MockBloc<WeatherState> implements WeatherBloc {}

class MockUserEntity extends Mock implements UserEntity {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  AuthenticationBloc _authBloc;
  group('Splash Page', () {
    setUp(() {
      _authBloc = MockAuthBloc();
    });

    testWidgets('renders correctly for initial state',
        (WidgetTester tester) async {
      when(_authBloc.state)
          .thenAnswer((_) => const AuthenticationState.initial());
      await tester.pumpWidget(
        BlocProvider<AuthenticationBloc>.value(
          value: _authBloc,
          child: MaterialApp(
            title: 'Test',
            home: SplashPage(),
          ),
        ),
      );
      // await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
    // testWidgets('renders correctly for authenticated state',
    //     (WidgetTester tester) async {
    //   await tester.runAsync(() async {
    //     when(_weatherBloc.state).thenAnswer((_) => WeatherState.initial());
    //     when(_authBloc.state)
    //         .thenAnswer((_) => AuthenticationState.authenticated(_mockUser));
    //     await tester.pumpWidget(
    //       MultiBlocProvider(
    //         providers: [
    //           BlocProvider<AuthenticationBloc>.value(value: _authBloc),
    //           BlocProvider<WeatherBloc>.value(value: _weatherBloc),
    //         ],
    //         child: MaterialApp(
    //           builder: ExtendedNavigator<Router>(
    //             router: Router(),
    //             observers: [_mockObserver],
    //           ),
    //           title: 'Flutter Demo',
    //         ),
    //       ),
    //     );
    //     expect(find.byType(Scaffold), findsOneWidget);
    //     expect(find.byType(Center), findsOneWidget);
    //     verify(_mockObserver.didPush());
    //   });
    // });
    // testWidgets('renders correctly for unauthenticated state',
    //     (WidgetTester tester) async {
    //   await tester.runAsync(() async {
    //     when(_authBloc.state)
    //         .thenAnswer((_) => const AuthenticationState.unauthenticated());
    //     await tester.pumpWidget(MultiBlocProvider(
    //       providers: [
    //         BlocProvider<AuthenticationBloc>.value(value: _authBloc),
    //         BlocProvider<SignInFormBloc>.value(value: _signInFormBloc),
    //       ],
    //       child: MaterialApp(title: 'Test', home: SplashPage()),
    //     ));
    //     expect(find.byType(Scaffold), findsOneWidget);
    //     expect(find.byType(Center), findsOneWidget);
    //     expect(find.byType(AuthenticationPage), findsOneWidget);
    //   });
    // });
  });
}
