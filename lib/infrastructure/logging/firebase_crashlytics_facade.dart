import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc_example/infrastructure/logging/i_firebase_crashlitycs_facade.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IFirebaseCrashlyticsFacade)
class FirebaseCrashlyticsFacade implements IFirebaseCrashlyticsFacade {
  final Crashlytics _firebaseCrashlytics;
  FirebaseCrashlyticsFacade(this._firebaseCrashlytics);

  @override
  Crashlytics getInstance() {
    return _firebaseCrashlytics;
  }
}
