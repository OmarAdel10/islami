import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/quran/cubit/quran_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef SuraMatches = bool Function(int index, String query);

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(const QuranState());

  Future<void> loadRecentIndexes(int suraCount) async {
    final prefs = await SharedPreferences.getInstance();
    final indexes = prefs.getStringList('mostRecentlyIndexes') ?? [];
    final recent = indexes
        .map((e) => int.tryParse(e) ?? 0)
        .whereType<int>()
        .toList();
    emit(
      state.copyWith(
        matchingIndexes: List.generate(suraCount, (i) => i),
        recentIndexes: recent,
      ),
    );
  }

  void search(String query, int suraCount, SuraMatches matches) {
    final matching = <int>[];
    for (int i = 0; i < suraCount; i++) {
      if (matches(i, query)) {
        matching.add(i);
      }
    }
    emit(
      state.copyWith(
        matchingIndexes: matching.isEmpty
            ? List.generate(suraCount, (i) => i)
            : matching,
        searchQuery: query,
      ),
    );
  }

  Future<void> onSuraTapped(int index, int suraCount) async {
    final recent = <int>[...state.recentIndexes];
    recent.remove(index);
    recent.insert(0, index);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'mostRecentlyIndexes',
      recent.map((e) => e.toString()).toList(),
    );

    emit(
      state.copyWith(
        matchingIndexes: List.generate(suraCount, (i) => i),
        recentIndexes: recent,
      ),
    );
  }
}
