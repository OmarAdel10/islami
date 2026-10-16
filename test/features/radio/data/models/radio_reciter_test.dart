import 'package:flutter_test/flutter_test.dart';
import 'package:islami/features/radio/data/models/radio_reciter.dart';

void main() {
  final reciter = RadioReciter(
    id: '1',
    name: 'Test Reciter',
    server: 'https://example.com/audio',
    rewaya: 'Hafs',
    count: 5,
    letter: 'T',
    surahs: [1, 2, 3, 4, 5],
  );

  test('props expose all fields', () {
    expect(reciter.props, [
      '1',
      'Test Reciter',
      'https://example.com/audio',
      'Hafs',
      5,
      'T',
      [1, 2, 3, 4, 5],
    ]);
  });

  test('surahUrl constructs correct mp3 URL', () {
    expect(reciter.surahUrl(1), 'https://example.com/audio/001.mp3');
    expect(reciter.surahUrl(12), 'https://example.com/audio/012.mp3');
    expect(reciter.surahUrl(114), 'https://example.com/audio/114.mp3');
  });

  test('fromJson parses reciter correctly', () {
    final parsed = RadioReciter.fromJson({
      'id': '2',
      'name': 'Parsed Reciter',
      'Server': 'https://parsed.com/audio',
      'rewaya': 'Warsh',
      'count': '3',
      'letter': 'P',
      'suras': '2,3,4',
    });
    expect(parsed.id, '2');
    expect(parsed.name, 'Parsed Reciter');
    expect(parsed.server, 'https://parsed.com/audio');
    expect(parsed.rewaya, 'Warsh');
    expect(parsed.count, 3);
    expect(parsed.letter, 'P');
    expect(parsed.surahs, [2, 3, 4]);
  });
}
