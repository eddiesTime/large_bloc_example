import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_bloc_example/presentation/core/unknown_route_page.dart';
import 'package:flutter_bloc_example/presentation/pages.dart';

export 'router.gr.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: WeatherPage, initial: true),
  AdaptiveRoute(page: SettingsPage),
  AdaptiveRoute(page: SearchPage),
  AdaptiveRoute(path: '*', page: UnknownRoutePage),
])
class $Router {}
