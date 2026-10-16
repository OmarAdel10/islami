import 'package:flutter_test/flutter_test.dart';
import 'package:islami/features/radio/cubit/radio_cubit.dart';
import 'package:islami/features/radio/cubit/radio_state.dart';

void main() {
  late RadioCubit cubit;

  setUp(() {
    cubit = RadioCubit();
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state has tab index 0', () {
    expect(cubit.state, const RadioState(currentTabIndex: 0));
  });

  test('setTabIndex updates currentTabIndex', () {
    cubit.setTabIndex(1);
    expect(cubit.state.currentTabIndex, 1);
    cubit.setTabIndex(0);
    expect(cubit.state.currentTabIndex, 0);
  });
}
