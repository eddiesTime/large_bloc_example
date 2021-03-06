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
import 'package:flutter_bloc_example/infrastructure/logging/fimber_facade.dart';
import 'package:flutter_bloc_example/infrastructure/logging/i_logging_facade.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_bloc_example/domain/settings/settings_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc_example/infrastructure/local_storage/local_storage_injectable_module.dart';
import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';
import 'package:flutter_bloc_example/domain/theme/theme_entity.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_bloc_example/infrastructure/weather/weather_repository_injectable_module.dart';
import 'package:weather_repository_core/weather_repository_core.dart';
import 'package:flutter_bloc_example/infrastructure/authentication/firebase_auth_facade.dart';
import 'package:flutter_bloc_example/domain/authentication/i_auth_facade.dart';
import 'package:flutter_bloc_example/infrastructure/geolocation/geolocator_facade.dart';
import 'package:flutter_bloc_example/domain/geolocation/i_geolocation_facade.dart';
import 'package:flutter_bloc_example/infrastructure/local_storage/local_storage_facade.dart';
import 'package:flutter_bloc_example/domain/local_storage/i_local_storage_facade.dart';
import 'package:flutter_bloc_example/infrastructure/weather/weather_repository_facade.dart';
import 'package:flutter_bloc_example/domain/weather/i_weather_facade.dart';
import 'package:flutter_bloc_example/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final geolocatorInjectableModule = _$GeolocatorInjectableModule();
  final localStorageInjectableModule = _$LocalStorageInjectableModule();
  final weatherRepositoryInjectableModule =
      _$WeatherRepositoryInjectableModule();
  g.registerLazySingleton<FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  g.registerLazySingleton<FirebaseUserMapper>(() => FirebaseUserMapper());
  g.registerLazySingleton<Geolocator>(
      () => geolocatorInjectableModule.geolocator);
  g.registerLazySingleton<GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  g.registerLazySingleton<SettingsBloc>(() => SettingsBloc());
  g.registerFactory<SettingsEntity>(() => SettingsEntity.celsius());
  final sharedPreferences = await localStorageInjectableModule.sharedPrefs;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  g.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  g.registerFactory<ThemeEntity>(() => ThemeEntity.initial());
  g.registerFactory<WeatherEntity>(() => WeatherEntity.initial());
  g.registerLazySingleton<WeatherRepository>(
      () => weatherRepositoryInjectableModule.weatherRepository);
  g.registerLazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
        g<FirebaseAuth>(),
        g<GoogleSignIn>(),
        g<FirebaseUserMapper>(),
        g<ILoggingFacade<FimberLog>>(),
      ));
  g.registerLazySingleton<IGeolocationFacade>(
      () => GeolocatorFacade(g<Geolocator>(), g<ILoggingFacade<FimberLog>>()));
  g.registerLazySingleton<ILocalStorageFacade>(() => LocalStorageFacade(
      g<SharedPreferences>(), g<ILoggingFacade<FimberLog>>()));
  g.registerLazySingleton<IWeatherFacade>(() => WeatherRepositoryFacade(
      g<WeatherRepository>(), g<ILoggingFacade<FimberLog>>()));
  g.registerLazySingleton<SignInFormBloc>(
      () => SignInFormBloc(g<IAuthFacade>()));
  g.registerLazySingleton<WeatherBloc>(() => WeatherBloc(
        g<IWeatherFacade>(),
        g<IGeolocationFacade>(),
        g<ILocalStorageFacade>(),
      ));
  g.registerLazySingleton<AuthenticationBloc>(
      () => AuthenticationBloc(g<IAuthFacade>()));

  //Register dev Dependencies --------
  if (environment == 'dev') {
    g.registerLazySingleton<ILoggingFacade<FimberLog>>(() => FimberFacade());
  }
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}

class _$GeolocatorInjectableModule extends GeolocatorInjectableModule {}

class _$LocalStorageInjectableModule extends LocalStorageInjectableModule {}

class _$WeatherRepositoryInjectableModule
    extends WeatherRepositoryInjectableModule {}
