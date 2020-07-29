import 'package:fimber/fimber.dart';
import 'package:flutter_bloc_example/infrastructure/logging/fimber_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFimberFacade extends Mock implements FimberFacade {}

class MockFimber extends Mock implements Fimber {}

class MockFimberLog extends Mock implements FimberLog {}

class MockTree extends Mock implements LogTree {}

void main() {
  group('Fimber Logging Facade', () {
    FimberFacade _mockFimberFacade;
    FimberLog _mockFimberLog;
    final FimberLog _fimberLog = FimberLog('Foo');
    final FimberFacade _fimberFacade = FimberFacade();
    const String _mockName = 'Foo';
    const String _mockMessage = 'Bar';

    setUp(() async {
      _mockFimberFacade = MockFimberFacade();
      _mockFimberLog = MockFimberLog();
    });

    test('should check if createNamedLogger(name) is working correctly', () {
      // when(_mockFimberFacade.createNamedLogger(name: _mockName))
      //     .thenReturn(_fimberLog);
      // expect(_mockFimberFacade.createNamedLogger(name: _mockName),
      //     isA<FimberLog>());
      // expect(
      //     _mockFimberFacade.createNamedLogger(name: _mockName).tag, _mockName);
      expect(
          FimberFacade().createNamedLogger(name: 'FooBar'), isA<FimberLog>());
      expect(FimberFacade().createNamedLogger(name: 'FooBar').tag,
          FimberLog('FooBar').tag);
    });
    // test(
    //     'should check if initializeLogging() is working correctly in case of logLevels not null',
    //     () {
    //   _mockFimberFacade.initializeLogging();
    //   verify(MockFimber.plantTree(MockTree())).called(1);
    // });
    // test(
    //     'should check if initializeLogging() is working correctly in case of logLevels is null',
    //     () {});
    test('should check if logDebug() is working correctly', () {
      _fimberFacade.logDebug(logger: _mockFimberLog, message: _mockMessage);
      verify(_mockFimberLog.d(_mockMessage)).called(1);
    });
    test('should check if logError() is working correctly', () {
      final StackTrace _mockStackTrace = StackTrace.empty;
      const Exception _mockException = FormatException();
      _fimberFacade.logError(
          logger: _mockFimberLog,
          message: _mockMessage,
          exception: _mockException,
          stackTrace: _mockStackTrace);
      verify(_mockFimberLog.e(
        _mockMessage,
        ex: _mockException,
        stacktrace: _mockStackTrace,
      )).called(1);
    });
    test('should check if logInfo() is working correctly', () {
      _fimberFacade.logInfo(logger: _mockFimberLog, message: _mockMessage);
      verify(_mockFimberLog.i(_mockMessage)).called(1);
    });
    test('should check if logVerbose() is working correctly', () {
      _fimberFacade.logVerbose(logger: _mockFimberLog, message: _mockMessage);
      verify(_mockFimberLog.v(_mockMessage)).called(1);
    });
    test('should check if logWarning() is working correctly', () {
      _fimberFacade.logWarning(logger: _mockFimberLog, message: _mockMessage);
      verify(_mockFimberLog.w(_mockMessage)).called(1);
    });
  });
}
