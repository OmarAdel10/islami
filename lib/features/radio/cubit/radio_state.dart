import 'package:equatable/equatable.dart';

class RadioState extends Equatable {
  final int currentTabIndex;

  const RadioState({this.currentTabIndex = 0});

  @override
  List<Object?> get props => [currentTabIndex];

  RadioState copyWith({int? currentTabIndex}) {
    return RadioState(currentTabIndex: currentTabIndex ?? this.currentTabIndex);
  }
}
