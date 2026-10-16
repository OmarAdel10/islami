import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islami/widgets/loading_indicator.dart';
import 'package:islami/Screens/home/tabs/Hadith/hadith_tab.dart';

void main() {
  testWidgets('renders loading state then category chips', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: HadithTab())),
    );

    // Initially loading while hadiths are fetched
    expect(find.byType(LoadingIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    // Once loaded, category chips are present
    expect(find.text('الكل'), findsOneWidget);
    expect(find.text('عام'), findsOneWidget);
  });
}
