import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Authentication Event', () {
    test(
        'should check whether AuthenticationEvent.authCheckRequested().toString() is working correctly',
        () {
      expect(const AuthenticationEvent.authCheckRequested().toString(),
          'AuthenticationEvent.authCheckRequested()');
    });
    test(
        'should check whether AuthenticationEvent.signedOut().toString() is working correctly',
        () {
      expect(const AuthenticationEvent.signedOut().toString(),
          'AuthenticationEvent.signedOut()');
    });
  });
}
