import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islami/features/hadith/data/models/hadith_model.dart';
import 'package:islami/Screens/home/tabs/Hadith/hadith_details.dart';

final _hadith = HadithModel(
  id: 'h1',
  number: 1,
  title: 'Test Title',
  content: ['Line one', 'Line two'],
  categories: ['general'],
);

void main() {
  testWidgets('renders hadith title and content', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamed(
                context,
                HadithDetails.routeName,
                arguments: _hadith,
              );
            });
            return const SizedBox();
          },
        ),
        onGenerateRoute: (settings) {
          if (settings.name == HadithDetails.routeName) {
            return MaterialPageRoute(
              builder: (_) => const HadithDetails(),
              settings: settings,
            );
          }
          return null;
        },
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Hadith 1'), findsOneWidget);
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Line one'), findsOneWidget);
    expect(find.text('Line two'), findsOneWidget);
  });
}
