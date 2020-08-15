import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_example/presentation/routes/router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      key: const Key('__Splash_Page_Bloc_Listener__'),
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) =>
              ExtendedNavigator.root.replace(Routes.weatherPage),
          unauthenticated: (_) =>
              ExtendedNavigator.root.replace(Routes.authenticationPage),
        );
      },
      child: _PageWidget(),
    );
  }
}

class _PageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      key: Key('__Splash_Page_Scaffold__'),
      body: Center(
        key: Key('__Splash_Page_Center__'),
        child: CircularProgressIndicator(
          key: Key('__Splash_Page_Progress_Indicator__'),
        ),
      ),
    );
  }
}
