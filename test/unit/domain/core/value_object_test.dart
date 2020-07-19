// import 'package:dartz/dartz.dart';
// import 'package:flutter_bloc_example/domain/authentication/auth_failure.dart';
// import 'package:flutter_bloc_example/domain/authentication/value_objects.dart';
// import 'package:flutter_bloc_example/domain/core/value_failure.dart';
// import 'package:flutter_bloc_example/domain/core/value_object.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('Core Value Object', () {
//     test(
//         'should check whether Authfailure.cancelledByUser().toString() is working correctly',
//         () {
//       final EmailAddress _mockValueObject = EmailAddress('Test');
//       expect(
//         _mockValueObject.value,
//         const Left(InvalidEmail(failedValue: 'Test')),
//       );
//     });
//     test(
//         'should check whether Authfailure.serverError().toString() is working correctly',
//         () {
//       expect(
//         const AuthFailure.serverError().toString(),
//         'AuthFailure.serverError()',
//       );
//     });
//     test(
//         'should check whether Authfailure.emailAlreadyInUse().toString() is working correctly',
//         () {
//       expect(
//         const AuthFailure.emailAlreadyInUse().toString(),
//         'AuthFailure.emailAlreadyInUse()',
//       );
//     });
//     test(
//         'should check whether Authfailure.invalidEmailAndPasswordCombination().toString() is working correctly',
//         () {
//       expect(
//         const AuthFailure.invalidEmailAndPasswordCombination().toString(),
//         'AuthFailure.invalidEmailAndPasswordCombination()',
//       );
//     });
//   });
// }
