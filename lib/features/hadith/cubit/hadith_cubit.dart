import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/features/hadith/data/hadith_repository.dart';
import 'package:islami/features/hadith/data/models/hadith_model.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  final HadithRepository _hadithRepository;

  HadithCubit({required HadithRepository hadithRepository})
    : _hadithRepository = hadithRepository,
      super(HadithState.initial());

  Future<void> loadHadiths() async {
    emit(state.copyWith(isLoading: true));
    try {
      final hadiths = await _hadithRepository.loadHadiths();
      final filteredHadiths = _hadithRepository.filterByCategory(
        hadiths,
        state.selectedCategory,
      );
      emit(
        state.copyWith(
          hadiths: hadiths,
          filteredHadiths: filteredHadiths,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void changeCategory(String category) {
    if (state.selectedCategory == category) return;
    final filteredHadiths = _hadithRepository.filterByCategory(
      state.hadiths,
      category,
    );
    emit(
      state.copyWith(
        selectedCategory: category,
        filteredHadiths: filteredHadiths,
      ),
    );
  }
}
