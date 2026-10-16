import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/radio/data/models/radio_reciter.dart';
import 'package:islami/features/radio/data/radio_repository.dart';
import 'package:islami/features/radio/cubit/radio_state.dart';
import 'package:just_audio/just_audio.dart';

class RadioCubit extends Cubit<RadioState> {
  static AudioPlayer Function() _audioPlayerFactory = () => AudioPlayer();

  static void setAudioPlayerFactory(AudioPlayer Function() factory) {
    _audioPlayerFactory = factory;
  }

  RadioCubit()
    : _audioPlayer = _audioPlayerFactory(),
      super(const RadioState()) {
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        emit(state.copyWith(isPlaying: false));
      } else {
        emit(
          state.copyWith(
            isPlaying: playerState.playing,
            position: _audioPlayer.position,
            duration: _audioPlayer.duration ?? Duration.zero,
          ),
        );
      }
    });
  }

  final AudioPlayer _audioPlayer;

  AudioPlayer get audioPlayer => _audioPlayer;

  void setTabIndex(int index) {
    emit(state.copyWith(currentTabIndex: index));
  }

  Future<void> loadReciters() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final repository = RadioRepository();
      final reciters = await repository.fetchReciters();
      emit(state.copyWith(reciters: reciters, isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void selectReciter(RadioReciter reciter) {
    emit(
      state.copyWith(
        selectedReciter: reciter,
        currentSurahNumber: reciter.surahs.isNotEmpty
            ? reciter.surahs.first
            : null,
        isPlaying: false,
      ),
    );
  }

  Future<void> playSurah(int surahNumber) async {
    final reciter = state.selectedReciter;
    if (reciter == null) return;

    final url = reciter.surahUrl(surahNumber);
    try {
      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
      emit(state.copyWith(isPlaying: true, currentSurahNumber: surahNumber));
    } catch (e) {
      emit(state.copyWith(error: 'Failed to play surah: $e'));
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    emit(state.copyWith(isPlaying: false));
  }

  Future<void> resume() async {
    await _audioPlayer.play();
    emit(state.copyWith(isPlaying: true));
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    emit(
      state.copyWith(
        isPlaying: false,
        currentSurahNumber: null,
        position: Duration.zero,
        duration: Duration.zero,
      ),
    );
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
