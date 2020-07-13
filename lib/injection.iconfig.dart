// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_bloc_example/infrastructure/authentication/firebase_injectable_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc_example/infrastructure/authentication/firebase_user_mapper.dart';
import 'package:flutter_bloc_example/infrastructure/geolocation/geolocator_injectable_module.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc_example/infrastructure/authentication/firebase_auth_facade.dart';
import 'package:flutter_bloc_example/domain/authentication/i_auth_facade.dart';
import 'package:flutter_bloc_example/infrastructure/geolocation/geolocator_repository_facade.dart';
import 'package:flutter_bloc_example/domain/geolocation/i_geolocation_facade.dart';
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
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final geolocatorInjectableModule = _$GeolocatorInjectableModule();
  final weatherRepositoryInjectableModule =
      _$WeatherRepositoryInjectableModule();
  g.registerLazySingleton<FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  g.registerLazySingleton<FirebaseUserMapper>(() => FirebaseUserMapper());
  g.registerLazySingleton<Geolocator>(
      () => geolocatorInjectableModule.geolocator);
  g.registerLazySingleton<GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  g.registerLazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
        g<FirebaseAuth>(),
        g<GoogleSignIn>(),
        g<FirebaseUserMapper>(),
      ));
  g.registerLazySingleton<IGeolocationFacade>(
      () => GeolocatorRepositoryFacade(g<Geolocator>()));
  g.registerFactory<SettingsBloc>(() => SettingsBloc());
  g.registerFactory<SettingsEntity>(() => SettingsEntity.celsius());
  g.registerLazySingleton<SignInFormBloc>(
      () => SignInFormBloc(g<IAuthFacade>()));
  g.registerFactory<ThemeBloc>(() => ThemeBloc());
  g.registerFactory<ThemeEntity>(() => ThemeEntity.initial());
  g.registerFactory<WeatherEntity>(() => WeatherEntity.initial());
  g.registerLazySingleton<WeatherRepository>(
      () => weatherRepositoryInjectableModule.weatherRepository);
  g.registerLazySingleton<AuthenticationBloc>(
      () => AuthenticationBloc(g<IAuthFacade>()));
  g.registerLazySingleton<IWeatherFacade>(
      () => WeatherRepositoryFacade(g<WeatherRepository>()));
  g.registerFactory<WeatherBloc>(
      () => WeatherBloc(g<IWeatherFacade>(), g<IGeolocationFacade>()));
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}

class _$GeolocatorInjectableModule extends GeolocatorInjectableModule {}

class _$WeatherRepositoryInjectableModule
    extends WeatherRepositoryInjectableModule {}
