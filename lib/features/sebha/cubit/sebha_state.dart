import 'package:equatable/equatable.dart';

class SebhaState extends Equatable {
  final int counter;
  final int sebhaIndex;
  final int sebhaCount;
  final double rotationBegin;
  final double rotationEnd;

  const SebhaState({
    this.counter = 0,
    this.sebhaIndex = 0,
    this.sebhaCount = 0,
    this.rotationBegin = 0.0,
    this.rotationEnd = 0.0,
  });

  @override
  List<Object?> get props => [
    counter,
    sebhaIndex,
    sebhaCount,
    rotationBegin,
    rotationEnd,
  ];

  SebhaState copyWith({
    int? counter,
    int? sebhaIndex,
    int? sebhaCount,
    double? rotationBegin,
    double? rotationEnd,
  }) {
    return SebhaState(
      counter: counter ?? this.counter,
      sebhaIndex: sebhaIndex ?? this.sebhaIndex,
      sebhaCount: sebhaCount ?? this.sebhaCount,
      rotationBegin: rotationBegin ?? this.rotationBegin,
      rotationEnd: rotationEnd ?? this.rotationEnd,
    );
  }
}
