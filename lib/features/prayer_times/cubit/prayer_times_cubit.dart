import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/prayer_times/cubit/prayer_times_state.dart';
import 'package:islami/features/prayer_times/data/prayer_times_repository.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit() : super(const PrayerTimesState()) {
    loadPrayerTimes();
  }

  final PrayerTimesRepository _repository = PrayerTimesRepository();

  Future<void> loadPrayerTimes() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final prayerTimes = await _repository.fetchPrayerTimes();
      emit(
        state.copyWith(prayerTimes: prayerTimes, isLoading: false, error: null),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void refresh() {
    loadPrayerTimes();
  }
}
