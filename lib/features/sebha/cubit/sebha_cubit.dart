import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/sebha/cubit/sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(const SebhaState());

  void incrementTasbeeh() {
    final previousAngle = state.rotationEnd;
    final newAngle = previousAngle + 2 * pi / 30;

    int newCounter = state.counter + 1;
    int newSebhaCount = state.sebhaCount + 1;
    int newSebhaIndex = state.sebhaIndex;

    if (newSebhaCount == 33) {
      newSebhaCount = 0;
      newSebhaIndex = (newSebhaIndex + 1) % sebhaTextsLength;
    }

    emit(
      state.copyWith(
        counter: newCounter,
        sebhaIndex: newSebhaIndex,
        sebhaCount: newSebhaCount,
        rotationBegin: previousAngle,
        rotationEnd: newAngle,
      ),
    );
  }
}

const int sebhaTextsLength = 39;
