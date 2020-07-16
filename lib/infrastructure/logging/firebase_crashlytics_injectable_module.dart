import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseCrashlyticsModule {
  @lazySingleton
  Crashlytics get crashlytics => Crashlytics.instance;
}
