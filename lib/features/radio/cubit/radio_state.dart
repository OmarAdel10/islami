import 'package:equatable/equatable.dart';
import 'package:islami/features/radio/data/models/radio_reciter.dart';

class RadioState extends Equatable {
  final int currentTabIndex;
  final List<RadioReciter> reciters;
  final bool isLoading;
  final String? error;
  final RadioReciter? selectedReciter;
  final bool isPlaying;
  final int? currentSurahNumber;
  final Duration position;
  final Duration duration;

  const RadioState({
    this.currentTabIndex = 0,
    this.reciters = const [],
    this.isLoading = false,
    this.error,
    this.selectedReciter,
    this.isPlaying = false,
    this.currentSurahNumber,
    this.position = Duration.zero,
    this.duration = Duration.zero,
  });

  @override
  List<Object?> get props => [
    currentTabIndex,
    reciters,
    isLoading,
    error,
    selectedReciter,
    isPlaying,
    currentSurahNumber,
    position,
    duration,
  ];

  RadioState copyWith({
    int? currentTabIndex,
    List<RadioReciter>? reciters,
    bool? isLoading,
    String? error,
    RadioReciter? selectedReciter,
    bool? isPlaying,
    int? currentSurahNumber,
    Duration? position,
    Duration? duration,
  }) {
    return RadioState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      reciters: reciters ?? this.reciters,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      selectedReciter: selectedReciter ?? this.selectedReciter,
      isPlaying: isPlaying ?? this.isPlaying,
      currentSurahNumber: currentSurahNumber ?? this.currentSurahNumber,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }
}
