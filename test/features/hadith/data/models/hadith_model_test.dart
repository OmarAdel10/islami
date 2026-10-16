import 'package:flutter_test/flutter_test.dart';
import 'package:islami/features/hadith/data/models/hadith_model.dart';

void main() {
  final model = HadithModel(
    id: 'h1',
    number: 1,
    title: 'Test Title',
    content: ['Line one', 'Line two'],
    categories: ['general'],
  );

  test('props expose all fields', () {
    expect(model.props, [
      'h1',
      1,
      'Test Title',
      ['Line one', 'Line two'],
      ['general'],
    ]);
  });

  test('equality compares all fields', () {
    final other = HadithModel(
      id: 'h1',
      number: 1,
      title: 'Test Title',
      content: ['Line one', 'Line two'],
      categories: ['general'],
    );
    final different = HadithModel(
      id: 'h2',
      number: 2,
      title: 'Other',
      content: ['Other'],
      categories: ['morning'],
    );
    expect(model, other);
    expect(model != different, isTrue);
  });
}
