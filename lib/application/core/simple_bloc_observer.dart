import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc_example/infrastructure/logging/i_logging_facade.dart';

class SimpleBlocObserver extends BlocObserver {
  final FimberLog _logger;
  final ILoggingFacade<FimberLog> _loggingFacade;

  SimpleBlocObserver(this._logger, this._loggingFacade);

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    _loggingFacade.logError(
        logger: _logger,
        message: bloc.runtimeType.toString(),
        exception: error,
        stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    _loggingFacade.logDebug(
      logger: _logger,
      message: '${bloc.runtimeType.toString()}: ${event.toString()}',
    );
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _loggingFacade.logDebug(
      logger: _logger,
      message: '${bloc.runtimeType.toString()}: ${transition.toString()}',
    );
    super.onTransition(bloc, transition);
  }
}
