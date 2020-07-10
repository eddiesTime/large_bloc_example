import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_example/injection.dart';
import 'package:flutter_bloc_example/presentation/flutter_bloc_app.dart';
import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialises the code generation for [get_it].
  configureInjection(Environment.prod);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => getIt<AuthenticationBloc>(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => getIt<ThemeBloc>(),
        ),
      ],
      child: FlutterBlocApp(),
    ),
  );
}
