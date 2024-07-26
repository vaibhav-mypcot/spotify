import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

part 'song_player_event.dart';
part 'song_player_state.dart';

class SongPlayerBloc extends Bloc<SongPlayerEvent, SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration staticDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongPlayerBloc() : super(SongPlayerLoading()) {}

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerSuccess());
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  Future<void> playOrPausedSong() async {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }

    emit(SongPlayerSuccess());
  }
}
