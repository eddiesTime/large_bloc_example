import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/domain/authentication/i_auth_facade.dart';
import 'package:flutter_bloc_example/domain/authentication/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

part 'authentication_bloc.freezed.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthFacade _authFacade;

  AuthenticationBloc(this._authFacade) : super(const Initial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield* event.map(
      authCheckRequested: (e) async* {
        final userOption = await _authFacade.getSignedInUser();
        yield userOption.fold(
          () => const AuthenticationState.unauthenticated(),
          (UserEntity user) => AuthenticationState.authenticated(user),
        );
      },
      signedOut: (e) async* {
        await _authFacade.signOut();
        yield const AuthenticationState.unauthenticated();
      },
    );
  }
}
