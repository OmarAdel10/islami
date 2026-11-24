import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islami/features/prayer_times/data/location_service.dart';
import 'package:islami/features/prayer_times/data/prayer_times_repository.dart';

class FakeLocationService implements LocationService {
  LocationPermission permission;
  LocationPermission? requestResult;
  bool serviceEnabled;
  Position? position;
  bool throwOnPosition = false;

  FakeLocationService({
    this.permission = LocationPermission.whileInUse,
    this.requestResult,
    this.serviceEnabled = true,
    this.position,
  });

  @override
  Future<LocationPermission> checkPermission() async => permission;

  @override
  Future<LocationPermission> requestPermission() async =>
      requestResult ?? permission;

  @override
  Future<bool> isLocationServiceEnabled() async => serviceEnabled;

  @override
  Future<Position> getCurrentPosition() async {
    if (throwOnPosition) {
      throw const PrayerTimesLocationException('Location unavailable');
    }
    return position ??
        Position(
          latitude: 30.0444,
          longitude: 31.2357,
          timestamp: DateTime(2026, 10, 16),
          accuracy: 10.0,
          altitude: 0.0,
          heading: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0,
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0,
          isMocked: false,
        );
  }
}

void main() {
  test('fetchPrayerTimes returns seven prayer times on success', () async {
    final repository = PrayerTimesRepository(
      locationService: FakeLocationService(),
    );

    final result = await repository.fetchPrayerTimes();

    expect(result.times, hasLength(7));
    expect(result.times.map((t) => t.name), contains('Fajr'));
    expect(result.times.map((t) => t.name), contains('Qibla'));
  });

  test('fetchPrayerTimes requests permission when initially denied', () async {
    final service = FakeLocationService(
      permission: LocationPermission.denied,
      requestResult: LocationPermission.whileInUse,
    );
    final repository = PrayerTimesRepository(locationService: service);

    final result = await repository.fetchPrayerTimes();

    expect(result.times, hasLength(7));
  });

  test(
    'fetchPrayerTimes throws when permission is denied after request',
    () async {
      final service = FakeLocationService(
        permission: LocationPermission.denied,
        requestResult: LocationPermission.denied,
      );
      final repository = PrayerTimesRepository(locationService: service);

      expect(
        repository.fetchPrayerTimes(),
        throwsA(isA<PrayerTimesLocationException>()),
      );
    },
  );

  test(
    'fetchPrayerTimes throws when permission is permanently denied',
    () async {
      final service = FakeLocationService(
        permission: LocationPermission.deniedForever,
      );
      final repository = PrayerTimesRepository(locationService: service);

      expect(
        repository.fetchPrayerTimes(),
        throwsA(isA<PrayerTimesLocationException>()),
      );
    },
  );

  test('fetchPrayerTimes throws when location services are disabled', () async {
    final service = FakeLocationService(serviceEnabled: false);
    final repository = PrayerTimesRepository(locationService: service);

    expect(
      repository.fetchPrayerTimes(),
      throwsA(isA<PrayerTimesLocationException>()),
    );
  });

  test(
    'fetchPrayerTimes surfaces a position failure as a location exception',
    () async {
      final service = FakeLocationService()..throwOnPosition = true;
      final repository = PrayerTimesRepository(locationService: service);

      expect(
        repository.fetchPrayerTimes(),
        throwsA(isA<PrayerTimesLocationException>()),
      );
    },
  );
}
