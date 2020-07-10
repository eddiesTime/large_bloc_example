import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_bloc_example/injection.dart';
import 'package:flutter_bloc_example/presentation/authentication/widgets/sign_in_form.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<SignInFormBloc>(
      create: (context) => getIt<SignInFormBloc>(),
      child: Center(
          child: SingleChildScrollView(
              child: Column(
        children: [_buildLogo(), const SignInForm()],
      ))),
    ));
  }
}

Image _buildLogo() {
  return const Image(
    image: AssetImage('flutter_logo.png'),
  );
}
