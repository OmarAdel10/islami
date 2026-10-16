import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islami/features/prayer_times/data/prayer_times_repository.dart';

void main() {
  late PrayerTimesRepository repository;

  setUp(() {
    repository = PrayerTimesRepository();
  });

  test('PrayerTimesRepository is instantiable', () {
    expect(repository, isA<PrayerTimesRepository>());
  });

  test('Position can be constructed for test', () {
    final position = Position(
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
    expect(position.latitude, 30.0444);
    expect(position.longitude, 31.2357);
  });
}
