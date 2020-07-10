import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_bloc_example/presentation/authentication/pages/authentication_page.dart';
import 'package:flutter_bloc_example/presentation/core/unknown_route_page.dart';
import 'package:flutter_bloc_example/presentation/pages.dart';
import 'package:flutter_bloc_example/presentation/splash/splash_page.dart';

export 'router.gr.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: SplashPage, initial: true),
  AdaptiveRoute(page: AuthenticationPage),
  AdaptiveRoute(page: WeatherPage),
  AdaptiveRoute(page: SettingsPage),
  AdaptiveRoute(page: SearchPage),
  AdaptiveRoute(path: '*', page: UnknownRoutePage),
])
class $Router {}
