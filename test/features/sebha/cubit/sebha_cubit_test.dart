import 'package:flutter_test/flutter_test.dart';
import 'package:islami/features/sebha/cubit/sebha_cubit.dart';
import 'package:islami/features/sebha/cubit/sebha_state.dart';

void main() {
  late SebhaCubit cubit;

  setUp(() {
    cubit = SebhaCubit();
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state is empty', () {
    expect(
      cubit.state,
      const SebhaState(counter: 0, sebhaIndex: 0, sebhaCount: 0),
    );
  });

  test('incrementTasbeeh increments counter and sebhaCount', () {
    cubit.incrementTasbeeh();
    expect(cubit.state.counter, 1);
    expect(cubit.state.sebhaCount, 1);
  });

  test('sebhaIndex wraps to 0 after 33 counts', () {
    for (int i = 0; i < 33; i++) {
      cubit.incrementTasbeeh();
    }
    expect(cubit.state.sebhaCount, 0);
    expect(cubit.state.sebhaIndex, 1);
    expect(cubit.state.counter, 33);
  });
}
