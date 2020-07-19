import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_example/application/core/simple_bloc_observer.dart';
import 'package:flutter_bloc_example/infrastructure/logging/i_logging_facade.dart';
import 'package:flutter_bloc_example/injection.dart';
import 'package:flutter_bloc_example/presentation/flutter_bloc_app.dart';
import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:fimber/fimber.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialises the code generation for [get_it].
  await configureInjection(Environment.dev);
  List<String> ONLY_ERROR = ["E"];
  // getIt<ILoggingFacade<FimberLog>>().initializeLogging();
  getIt<ILoggingFacade<FimberLog>>().initializeLogging(logLevels: ONLY_ERROR);
  Bloc.observer = SimpleBlocObserver(
      getIt<ILoggingFacade<FimberLog>>()
          .createNamedLogger(name: 'Bloc Observer'),
      getIt<ILoggingFacade<FimberLog>>());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) =>
              getIt<AuthenticationBloc>()..add(const AuthCheckRequested()),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => getIt<ThemeBloc>(),
        ),
      ],
      child: FlutterBlocApp(),
    ),
  );
}
