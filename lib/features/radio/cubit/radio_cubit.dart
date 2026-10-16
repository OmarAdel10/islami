import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/radio/cubit/radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(const RadioState());

  void setTabIndex(int index) {
    emit(state.copyWith(currentTabIndex: index));
  }
}
