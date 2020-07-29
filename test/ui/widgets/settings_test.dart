import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_bloc_example/domain/authentication/user_entity.dart';
import 'package:flutter_bloc_example/domain/authentication/value_objects.dart';
import 'package:flutter_bloc_example/domain/core/value_object.dart';
import 'package:flutter_bloc_example/presentation/settings/widgets/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

class MockSettingsBloc extends MockBloc<SettingsState> implements SettingsBloc {
}

class MockAuthBloc extends MockBloc<AuthenticationState>
    implements AuthenticationBloc {}

void main() {
  group('Settings Widget', () {
    SettingsBloc _settingsBloc;
    AuthenticationBloc _authBloc;

    setUp(() {
      _settingsBloc = MockSettingsBloc();
      _authBloc = MockAuthBloc();
    });
    testWidgets('should render correctly', (WidgetTester tester) async {
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      await tester.pumpWidget(
        BlocProvider<SettingsBloc>.value(
          value: _settingsBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Settings(),
            ),
          ),
        ),
      );
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byKey(const Key('__Units_List_Tile__')), findsOneWidget);
      expect(find.text('Temperature Units'), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
      expect(find.byKey(const Key('__Logout_Box__')), findsOneWidget);
      expect(find.byKey(const Key('__Logout_List_Tile__')), findsOneWidget);
    });

    testWidgets(
        'should verify that the switch is toggled to inactive when Temperature Unit is TemperatureUnit.fahrenheit',
        (WidgetTester tester) async {
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.fahrenheit());
      await tester.pumpWidget(
        BlocProvider<SettingsBloc>.value(
          value: _settingsBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Settings(),
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate(
          (widget) => widget is Switch && widget.value == false);
      expect(finder, findsOneWidget);
    });

    testWidgets(
        'should verify that the switch is toggled to active when Temperature Unit is TemperatureUnit.celcius',
        (WidgetTester tester) async {
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      await tester.pumpWidget(
        BlocProvider<SettingsBloc>.value(
          value: _settingsBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Settings(),
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate(
          (widget) => widget is Switch && widget.value == true);
      expect(finder, findsOneWidget);
    });
    testWidgets(
        'should verify that the switch is emitting the event SettingsEvent.toggleTemperatureUnit when toggled',
        (WidgetTester tester) async {
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      await tester.pumpWidget(
        BlocProvider<SettingsBloc>.value(
          value: _settingsBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Settings(),
            ),
          ),
        ),
      );
      await tester.tap(find.byKey(const Key('__Settings_Switch__')));
      await tester.pumpAndSettle();
      verify(
          _settingsBloc.add(const SettingsEvent.toggleTemperatureUnit(false)));
    });
    testWidgets(
        'should verify that the switch is emitting the event SettingsEvent.toggleTemperatureUnit when toggled',
        (WidgetTester tester) async {
      final UniqueId _mockId = UniqueId();
      final StringSingleLine _mockName = StringSingleLine('Foobar');
      final EmailAddress _mockEmail = EmailAddress('foo.bar@test.com');
      final UserEntity _mockUser =
          UserEntity(id: _mockId, name: _mockName, emailAddress: _mockEmail);
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      when(_authBloc.state)
          .thenAnswer((_) => AuthenticationState.authenticated(_mockUser));
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<SettingsBloc>.value(
            value: _settingsBloc,
          ),
          BlocProvider<AuthenticationBloc>.value(
            value: _authBloc,
          ),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Settings(),
          ),
        ),
      ));
      await tester.tap(find.byKey(const Key('__Logout_List_Tile__')));
      await tester.pumpAndSettle();
      verify(_authBloc.add(const AuthenticationEvent.signedOut()));
    });
  });
}
