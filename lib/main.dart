import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/injection.dart';
import 'package:flutter_bloc_example/presentation/flutter_bloc_app.dart';
import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:print_lumberdash/print_lumberdash.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_lumberdash/firebase_lumberdash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialises the code generation for [get_it].
  configureInjection(Environment.prod);
  putLumberdashToWork(withClients: [
    PrintLumberdash(),
    FirebaseLumberdash(
        firebaseAnalyticsClient: FirebaseAnalytics(),
        environment: 'development',
        releaseVersion: '1.0.0')
  ]);
  logWarning('Hello Warning');
  logFatal('Hello Fatal!');
  logMessage('Hello Message!');
  logError(Exception('Hello Error'));
  runApp(
    BlocProvider<ThemeBloc>(
      create: (context) => getIt<ThemeBloc>(),
      child: FlutterBlocApp(),
    ),
  );
}
