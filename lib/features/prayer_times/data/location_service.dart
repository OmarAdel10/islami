import 'package:geolocator/geolocator.dart';

/// Thin wrapper over [Geolocator] so prayer-time logic is testable without
/// a platform channel.
abstract class LocationService {
  Future<LocationPermission> checkPermission();
  Future<LocationPermission> requestPermission();
  Future<bool> isLocationServiceEnabled();
  Future<Position> getCurrentPosition();
}

class GeolocatorLocationService implements LocationService {
  const GeolocatorLocationService();

  @override
  Future<LocationPermission> checkPermission() => Geolocator.checkPermission();

  @override
  Future<LocationPermission> requestPermission() =>
      Geolocator.requestPermission();

  @override
  Future<bool> isLocationServiceEnabled() =>
      Geolocator.isLocationServiceEnabled();

  @override
  Future<Position> getCurrentPosition() => Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(accuracy: LocationAccuracy.medium),
  );
}

/// Raised when prayer times cannot be computed because location is
/// unavailable or not permitted.
class PrayerTimesLocationException implements Exception {
  final String message;

  const PrayerTimesLocationException(this.message);

  @override
  String toString() => message;
}
