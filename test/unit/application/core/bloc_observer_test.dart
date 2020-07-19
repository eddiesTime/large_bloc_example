// import 'package:fimber/fimber.dart';
// import 'package:flutter_bloc_example/application/core/simple_bloc_observer.dart';
// import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
// import 'package:flutter_bloc_example/infrastructure/logging/i_logging_facade.dart';
// import 'package:mockito/mockito.dart';
// import 'package:test/test.dart';

// class MockLoggingFacade<FimberLog> extends Mock
//     implements ILoggingFacade<FimberLog> {}

// class MockFimberLog extends Mock implements FimberLog {}

// void main() {
//   SimpleBlocObserver _mockObserver;
//   ILoggingFacade<FimberLog> _logginFacade = MockLoggingFacade<FimberLog>();
//   FimberLog _mockLogger =
//       _logginFacade.createNamedLogger(name: 'Bloc Observer');

//   setUp(() {
//     _mockObserver = SimpleBlocObserver(_mockLogger, _logginFacade);
//   });
//   group('Blog Observer', () {
//     test('abc', () {
//       when(_logginFacade.createNamedLogger(name: 'Bloc Observer'))
//           .thenAnswer((_) => _mockLogger);
//       when(_mockObserver.onError(SettingsBloc(), Error(), StackTrace.empty))
//           .thenReturn(_logginFacade.logError(
//               logger: _mockLogger,
//               message: SettingsBloc().runtimeType.toString(),
//               exception: Error(),
//               stackTrace: StackTrace.empty));
//       verify(_logginFacade.logError(
//               logger: null,
//               message: SettingsBloc().runtimeType.toString(),
//               exception: Error(),
//               stackTrace: StackTrace.empty))
//           .called(1);
//     });
//   });
// }
