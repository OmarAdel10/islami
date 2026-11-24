import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islami/Screens/home/tabs/Radio/tabs/reciters_content_tab.dart';
import 'package:islami/features/radio/cubit/radio_cubit.dart';
import 'package:islami/features/radio/data/models/radio_reciter.dart';
import 'package:islami/features/radio/data/radio_repository.dart';

class FakeRadioRepository extends RadioRepository {
  final List<RadioReciter> reciters;

  FakeRadioRepository(this.reciters);

  @override
  Future<List<RadioReciter>> fetchReciters() async => reciters;
}

RadioReciter buildReciter(String id, String name) => RadioReciter(
  id: id,
  name: name,
  server: 'https://srv.com/audio',
  rewaya: 'Hafs',
  count: 1,
  letter: 'T',
  surahs: const [1],
);

void main() {
  testWidgets('renders reciters from RadioCubit state', (tester) async {
    final cubit = RadioCubit(
      repository: FakeRadioRepository([
        buildReciter('1', 'Reciter One'),
        buildReciter('2', 'Reciter Two'),
      ]),
    );
    addTearDown(cubit.close);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<RadioCubit>.value(
          value: cubit,
          child: const Scaffold(body: RecitersContentTab()),
        ),
      ),
    );

    // Before loading, the empty state is shown.
    expect(find.text('No reciters available'), findsOneWidget);
    expect(find.text('Reciter One'), findsNothing);

    await cubit.loadReciters();
    await tester.pump();

    expect(find.text('Reciter One'), findsOneWidget);
    expect(find.text('Reciter Two'), findsOneWidget);
    expect(find.text('No reciters available'), findsNothing);
  });
}
