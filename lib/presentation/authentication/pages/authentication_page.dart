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
        key: const Key('__Auth_Page_BlocProvider<SignInFormBloc>__'),
        create: (context) => getIt<SignInFormBloc>(),
        child: const Center(
            key: Key('__AUTHENTICATION_PAGE_CENTER__'),
            child: SignInForm(
              key: Key('__SIGN_IN_FORM_WIDGET__'),
            )),
      ),
    );
  }
}
