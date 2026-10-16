import 'package:flutter_test/flutter_test.dart';
import 'package:islami/features/hadith/data/hadith_repository.dart';
import 'package:islami/features/hadith/data/models/hadith_model.dart';

void main() {
  late HadithRepository repository;

  setUp(() {
    repository = HadithRepository();
  });

  final hadiths = [
    HadithModel(
      id: 'h1',
      number: 1,
      title: 'General One',
      content: ['c1'],
      categories: ['general'],
    ),
    HadithModel(
      id: 'h2',
      number: 2,
      title: 'Morning One',
      content: ['c2'],
      categories: ['morning'],
    ),
    HadithModel(
      id: 'h3',
      number: 3,
      title: 'Both',
      content: ['c3'],
      categories: ['general', 'morning'],
    ),
  ];

  test('filterByCategory all returns all hadiths', () {
    expect(repository.filterByCategory(hadiths, 'all'), hadiths);
  });

  test('filterByCategory empty string returns all hadiths', () {
    expect(repository.filterByCategory(hadiths, ''), hadiths);
  });

  test('filterByCategory morning returns only morning hadiths', () {
    final result = repository.filterByCategory(hadiths, 'morning');
    expect(result, hasLength(2));
    expect(
      result.every((hadith) => hadith.categories.contains('morning')),
      isTrue,
    );
  });

  test('filterByCategory unknown category returns empty', () {
    expect(repository.filterByCategory(hadiths, 'nonexistent'), isEmpty);
  });
}
