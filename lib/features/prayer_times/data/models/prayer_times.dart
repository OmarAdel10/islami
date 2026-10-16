import 'package:equatable/equatable.dart';

class PrayerTime {
  const PrayerTime({required this.name, required this.time});

  final String name;
  final String time;
}

class PrayerTimesModel extends Equatable {
  final List<PrayerTime> times;
  final DateTime date;

  const PrayerTimesModel({required this.times, required this.date});

  PrayerTime? get fajr => times.firstWhere(
    (t) => t.name == 'Fajr',
    orElse: () => const PrayerTime(name: 'Fajr', time: '-'),
  );
  PrayerTime? get sunrise => times.firstWhere(
    (t) => t.name == 'Sunrise',
    orElse: () => const PrayerTime(name: 'Sunrise', time: '-'),
  );
  PrayerTime? get dhuhr => times.firstWhere(
    (t) => t.name == 'Dhuhr',
    orElse: () => const PrayerTime(name: 'Dhuhr', time: '-'),
  );
  PrayerTime? get asr => times.firstWhere(
    (t) => t.name == 'Asr',
    orElse: () => const PrayerTime(name: 'Asr', time: '-'),
  );
  PrayerTime? get maghrib => times.firstWhere(
    (t) => t.name == 'Maghrib',
    orElse: () => const PrayerTime(name: 'Maghrib', time: '-'),
  );
  PrayerTime? get isha => times.firstWhere(
    (t) => t.name == 'Isha',
    orElse: () => const PrayerTime(name: 'Isha', time: '-'),
  );
  PrayerTime? get qibla {
    try {
      return times.firstWhere((t) => t.name == 'Qibla');
    } catch (_) {
      return null;
    }
  }

  @override
  List<Object?> get props => [times, date];
}
