import 'package:flutter_bloc_example/domain/geolocation/i_geolocation_facade.dart';
import 'package:flutter_bloc_example/infrastructure/logging/i_logging_facade.dart';
import 'package:flutter_bloc_example/injection.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:fimber/fimber.dart';

@LazySingleton(as: IGeolocationFacade)
class GeolocatorFacade implements IGeolocationFacade {
  final Geolocator _geolocator;
  final FimberLog _logger =
      getIt<ILoggingFacade<FimberLog>>().createNamedLogger(name: 'Geolocation');

  GeolocatorFacade(this._geolocator);

  @override
  Future<Position> getCurrentUserPosition() {
    try {
      return _geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e, s) {
      getIt<ILoggingFacade<FimberLog>>().logError(
          logger: _logger,
          message: 'Get current user position',
          exception: e,
          stackTrace: s);
      return Future.value(Position(mocked: true));
    }
  }
}
