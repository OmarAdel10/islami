import 'package:flutter_test/flutter_test.dart';
import 'package:islami/features/hadith/cubit/hadith_cubit.dart';
import 'package:islami/features/hadith/data/hadith_repository.dart';

void main() {
  late HadithCubit cubit;

  setUp(() {
    cubit = HadithCubit(hadithRepository: HadithRepository());
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state is not loading with empty hadiths', () {
    expect(
      cubit.state,
      const HadithState(
        hadiths: [],
        filteredHadiths: [],
        selectedCategory: 'all',
        isLoading: false,
        errorMessage: null,
      ),
    );
  });

  test('changeCategory updates selected category and filters', () {
    cubit.changeCategory('morning');
    expect(cubit.state.selectedCategory, 'morning');
    expect(cubit.state.filteredHadiths, isEmpty);
  });

  test('changeCategory to all restores all hadiths', () {
    cubit.changeCategory('morning');
    cubit.changeCategory('all');
    expect(cubit.state.selectedCategory, 'all');
  });
}
