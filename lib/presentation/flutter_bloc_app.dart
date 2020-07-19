import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/blocs.dart';
import 'package:flutter_bloc_example/injection.dart';
import 'package:flutter_bloc_example/presentation/routes/router.gr.dart';

class FlutterBlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Rebuilds the MaterialApp whenever the ThemeState changes.
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MultiBlocProvider(
            providers: [
              BlocProvider<WeatherBloc>(
                create: (_) => getIt<WeatherBloc>()
                  ..add(
                    const LoadFromStorage(),
                  ),
              ),
              BlocProvider<SettingsBloc>(
                create: (context) => getIt<SettingsBloc>(),
              )
            ],
            child: MaterialApp(
              builder: ExtendedNavigator<Router>(
                router: Router(),
              ),
              title: 'Flutter Demo',
              theme: themeState.themeEntity.themeData,
            ));
      },
    );
  }
}
