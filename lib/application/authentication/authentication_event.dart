part of 'authentication_bloc.dart';

@freezed
abstract class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthenticationEvent.signedOut() = SignedOut;
}
