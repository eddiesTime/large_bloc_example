// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_example/presentation/splash/splash_page.dart';
import 'package:flutter_bloc_example/presentation/authentication/pages/authentication_page.dart';
import 'package:flutter_bloc_example/presentation/weather/pages/weather_page.dart';
import 'package:flutter_bloc_example/presentation/settings/pages/settings_page.dart';
import 'package:flutter_bloc_example/presentation/location_search/pages/search_page.dart';
import 'package:flutter_bloc_example/presentation/core/unknown_route_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String authenticationPage = '/authentication-page';
  static const String weatherPage = '/weather-page';
  static const String settingsPage = '/settings-page';
  static const String searchPage = '/search-page';
  static const String unknownRoutePage = '*';
  static const all = <String>{
    splashPage,
    authenticationPage,
    weatherPage,
    settingsPage,
    searchPage,
    unknownRoutePage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.authenticationPage, page: AuthenticationPage),
    RouteDef(Routes.weatherPage, page: WeatherPage),
    RouteDef(Routes.settingsPage, page: SettingsPage),
    RouteDef(Routes.searchPage, page: SearchPage),
    RouteDef(Routes.unknownRoutePage, page: UnknownRoutePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (RouteData data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SplashPage(),
        settings: data,
      );
    },
    AuthenticationPage: (RouteData data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AuthenticationPage(),
        settings: data,
      );
    },
    WeatherPage: (RouteData data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => WeatherPage(),
        settings: data,
      );
    },
    SettingsPage: (RouteData data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SettingsPage(),
        settings: data,
      );
    },
    SearchPage: (RouteData data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SearchPage(),
        settings: data,
      );
    },
    UnknownRoutePage: (RouteData data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => UnknownRoutePage(),
        settings: data,
      );
    },
  };
}
