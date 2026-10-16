import 'package:flutter_test/flutter_test.dart';
import 'package:islami/features/prayer_times/data/models/prayer_times.dart';

void main() {
  final times = PrayerTimesModel(
    times: [
      const PrayerTime(name: 'Fajr', time: '05:00'),
      const PrayerTime(name: 'Dhuhr', time: '12:30'),
      const PrayerTime(name: 'Asr', time: '15:45'),
      const PrayerTime(name: 'Maghrib', time: '18:20'),
      const PrayerTime(name: 'Isha', time: '19:45'),
    ],
    date: DateTime(2026, 10, 16),
  );

  test('props expose all fields', () {
    expect(times.props, [times.times, times.date]);
  });

  test('getters return correct prayer times', () {
    expect(times.fajr?.time, '05:00');
    expect(times.dhuhr?.time, '12:30');
    expect(times.asr?.time, '15:45');
    expect(times.maghrib?.time, '18:20');
    expect(times.isha?.time, '19:45');
  });

  test('getters return null for missing prayer', () {
    expect(times.qibla, isNull);
  });

  test('sunrise getter works when present', () {
    final withSunrise = PrayerTimesModel(
      times: [
        const PrayerTime(name: 'Sunrise', time: '06:15'),
      ],
      date: DateTime(2026, 10, 16),
    );
    expect(withSunrise.sunrise?.time, '06:15');
  });
}
