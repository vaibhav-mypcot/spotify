import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/utils/utils.dart';

part 'song_player_event.dart';
part 'song_player_state.dart';

class SongPlayerBloc extends Bloc<SongPlayerEvent, SongPlayerState> {
  final AudioPlayer audioPlayer;
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  bool isRepeatClicked = false;
  bool isShuffleClicked = false;

  SongPlayerBloc(this.audioPlayer) : super(SongPlayerLoading()) {
    on<LoadSong>(_onLoadSong);
    on<PlayOrPauseSong>(_onPlayOrPauseSong);
    on<UpdateSongPlayer>(_onUpdatePosition);
    on<SeekSong>(_onSeekSong);
    on<ShuffleSongClickedEvent>(_onShuffleSongClicked);
    on<SongEndedEvent>(_onSongEndedEvent);
    on<RepeatSongClickedEvent>(_onRepeatSongClickedEvent);
    on<SongRepeatEvent>(_onSongRepeatEvent);
    // on<SkeepToNextPreviousSongEvent>(_onSkeepToNextPreviousSongEvent);

    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      add(UpdateSongPlayer());
      if (Utils.formatDuration(songPosition) ==
          Utils.formatDuration(songDuration)) {
        if (isShuffleClicked) {
          add(SongEndedEvent());
        } else if (isRepeatClicked) {
          add(SongRepeatEvent());
        }
        print('song closed');
      }
    });

    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
    });
  }

  void _onUpdatePosition(
      UpdateSongPlayer event, Emitter<SongPlayerState> emit) {
    emit(SongPlayerLoaded(
      songDuration: songDuration,
      songPosition: songPosition,
      isPlaying: audioPlayer.playing,
    ));
  }

  void _onShuffleSongClicked(
      ShuffleSongClickedEvent event, Emitter<SongPlayerState> emit) {
    isShuffleClicked = event.isShuffle;
    print("shuffled ${isShuffleClicked}");
  }

  void _onSongEndedEvent(SongEndedEvent event, Emitter<SongPlayerState> emit) {
    emit(ShuffleSongActiveState());
  }

  void _onRepeatSongClickedEvent(
      RepeatSongClickedEvent event, Emitter<SongPlayerState> emit) {
    isRepeatClicked = event.isRepeat;
    print("repeated ${isRepeatClicked}");
  }

  void _onSongRepeatEvent(
      SongRepeatEvent event, Emitter<SongPlayerState> emit) {
    emit(RepeatSongActiveState());
  }

  Future<void> _onLoadSong(
      LoadSong event, Emitter<SongPlayerState> emit) async {
    print(
        "Song: '${Constatnts.songFirestorage}${event.artist}${event.title}.mp3?${Constatnts.mediaAlt}'");

    String url =
        '${Constatnts.songFirestorage}${event.artist}${event.title}.mp3?${Constatnts.mediaAlt}';
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerLoaded(
        songDuration: songDuration,
        songPosition: songPosition,
        isPlaying: audioPlayer.playing,
      ));
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  void _onPlayOrPauseSong(
      PlayOrPauseSong event, Emitter<SongPlayerState> emit) {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }
    emit(SongPlayerLoaded(
      songDuration: songDuration,
      songPosition: songPosition,
      isPlaying: audioPlayer.playing,
    ));
  }

  void _onSeekSong(SeekSong event, Emitter<SongPlayerState> emit) {
    audioPlayer.seek(event.position);
    songPosition = event.position;
    emit(SongPlayerLoaded(
      songDuration: songDuration,
      songPosition: songPosition,
      isPlaying: audioPlayer.playing,
    ));
  }

  // _onSkeepToNextPreviousSongEvent(
  //     SkeepToNextPreviousSongEvent event, Emitter<SongPlayerState> emit) {
  //   emit(SkeepToNextPreviousSongState(event.indexPosition));
  // }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
