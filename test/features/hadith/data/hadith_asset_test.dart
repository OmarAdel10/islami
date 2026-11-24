import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'hadiths.json contains contiguous ids and numbers with sources',
    () async {
      final raw = await rootBundle.loadString(
        'assets/data/hadith/hadiths.json',
      );
      final decoded = json.decode(raw) as Map<String, dynamic>;
      final hadiths = decoded['hadiths'] as List<dynamic>;

      expect(hadiths, isNotEmpty);

      for (var i = 0; i < hadiths.length; i++) {
        final hadith = hadiths[i] as Map<String, dynamic>;
        expect(hadith['id'], 'h${i + 1}');
        expect(hadith['number'], i + 1);
        expect(hadith['source'], isA<String>());
        expect((hadith['source'] as String).trim(), isNotEmpty);
      }
    },
  );
}
