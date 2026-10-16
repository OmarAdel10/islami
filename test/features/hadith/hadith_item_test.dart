import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islami/features/hadith/data/models/hadith_model.dart';
import 'package:islami/Screens/home/tabs/Hadith/hadith_item.dart';

void main() {
  testWidgets('renders hadith title and content lines', (tester) async {
    final hadith = HadithModel(
      id: 'h1',
      number: 1,
      title: 'Test Title',
      content: ['Line one', 'Line two'],
      categories: ['general'],
    );

    await tester.pumpWidget(MaterialApp(home: HadithItem(hadith: hadith)));

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Line one'), findsOneWidget);
    expect(find.text('Line two'), findsOneWidget);
  });
}
