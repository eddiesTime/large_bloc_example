// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_bloc_example/infrastructure/authentication/firebase_user_mapper.dart';
import 'package:flutter_bloc_example/infrastructure/authentication/firebase_auth_facade.dart';
import 'package:flutter_bloc_example/domain/authentication/i_auth_facade.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_bloc_example/domain/settings/settings_entity.dart';
import 'package:flutter_bloc_example/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';
import 'package:flutter_bloc_example/domain/theme/theme_entity.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_bloc_example/infrastructure/weather/weather_repository_injectable_module.dart';
import 'package:weather_repository_core/weather_repository_core.dart';
import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_example/infrastructure/weather/weather_repository_facade.dart';
import 'package:flutter_bloc_example/domain/weather/i_weather_facade.dart';
import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final weatherRepositoryInjectableModule =
      _$WeatherRepositoryInjectableModule();
  g.registerLazySingleton<FirebaseUserMapper>(() => FirebaseUserMapper());
  g.registerLazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
        g<FirebaseAuth>(),
        g<GoogleSignIn>(),
        g<FirebaseUserMapper>(),
      ));
  g.registerFactory<SettingsBloc>(() => SettingsBloc());
  g.registerFactory<SettingsEntity>(() => SettingsEntity.celsius());
  g.registerFactory<SignInFormBloc>(() => SignInFormBloc(g<IAuthFacade>()));
  g.registerFactory<ThemeBloc>(() => ThemeBloc());
  g.registerFactory<ThemeEntity>(() => ThemeEntity.initial());
  g.registerFactory<WeatherEntity>(() => WeatherEntity.initial());
  g.registerLazySingleton<WeatherRepository>(
      () => weatherRepositoryInjectableModule.weatherRepository);
  g.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(g<IAuthFacade>()));
  g.registerLazySingleton<IWeatherFacade>(
      () => WeatherRepositoryFacade(g<WeatherRepository>()));
  g.registerFactory<WeatherBloc>(() => WeatherBloc(g<IWeatherFacade>()));
}

class _$WeatherRepositoryInjectableModule
    extends WeatherRepositoryInjectableModule {}
