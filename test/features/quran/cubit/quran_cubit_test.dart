import 'package:flutter_test/flutter_test.dart';
import 'package:islami/features/quran/cubit/quran_cubit.dart';
import 'package:islami/features/quran/cubit/quran_state.dart';

bool _matches(int index, String query) {
  final names = ['alpha', 'beta', 'gamma'];
  return names[index].contains(query);
}

void main() {
  late QuranCubit cubit;

  setUp(() {
    cubit = QuranCubit();
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state has empty matching and recent indexes', () {
    expect(cubit.state.matchingIndexes, isEmpty);
    expect(cubit.state.recentIndexes, isEmpty);
    expect(cubit.state.searchQuery, isEmpty);
  });

  test('search filters matching indexes', () {
    cubit.search('a', 3, _matches);
    expect(cubit.state.searchQuery, 'a');
    expect(cubit.state.matchingIndexes, containsAll([0, 1, 2]));
  });

  test('search with no match falls back to all indexes', () {
    cubit.search('zzz', 3, _matches);
    expect(cubit.state.matchingIndexes, [0, 1, 2]);
  });
}
