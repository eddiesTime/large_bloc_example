import 'package:flutter_bloc_example/domain/geolocation/i_geolocation_facade.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IGeolocationFacade)
class GeolocatorFacade implements IGeolocationFacade {
  final Geolocator _geolocator;

  GeolocatorFacade(this._geolocator);

  @override
  Future<Position> getCurrentUserPosition() {
    return _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }
}