part of 'song_player_bloc.dart';

@immutable
sealed class SongPlayerEvent {}

class LoadSong extends SongPlayerEvent {
  final String artist;
  final String title;
  LoadSong(this.artist, this.title);
}

class PlayOrPauseSong extends SongPlayerEvent {

}

class UpdateSongPlayer extends SongPlayerEvent {}

class SeekSong extends SongPlayerEvent {
  final Duration position;
  SeekSong(this.position);
}

class RepeatSongClickedEvent extends SongPlayerEvent {
  bool isRepeat;
  RepeatSongClickedEvent(this.isRepeat);
}

class ShuffleSongClickedEvent extends SongPlayerEvent {
  bool isShuffle;
  ShuffleSongClickedEvent(this.isShuffle);
}

class SongEndedEvent extends SongPlayerEvent {}

class SongRepeatEvent extends SongPlayerEvent {}


// class SkeepToNextPreviousSongEvent extends SongPlayerEvent {
//   int indexPosition;
//   SkeepToNextPreviousSongEvent(this.indexPosition);
// }

// class SkeepToNextSong extends SongPlayerEvent {
//   int indexPosition;
//   SkeepToNextSong(this.indexPosition);
// }

// class SkeepToPreviousSong extends SongPlayerEvent {
//   int indexPosition;
//   SkeepToPreviousSong(this.indexPosition);
// }
