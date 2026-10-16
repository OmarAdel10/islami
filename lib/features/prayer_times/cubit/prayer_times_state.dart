import 'package:equatable/equatable.dart';
import 'package:islami/features/prayer_times/data/models/prayer_times.dart';

class PrayerTimesState extends Equatable {
  final PrayerTimesModel? prayerTimes;
  final bool isLoading;
  final String? error;

  const PrayerTimesState({
    this.prayerTimes,
    this.isLoading = false,
    this.error,
  });

  @override
  List<Object?> get props => [prayerTimes, isLoading, error];

  PrayerTimesState copyWith({
    PrayerTimesModel? prayerTimes,
    bool? isLoading,
    String? error,
  }) {
    return PrayerTimesState(
      prayerTimes: prayerTimes ?? this.prayerTimes,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
