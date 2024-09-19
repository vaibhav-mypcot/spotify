part of 'song_player_bloc.dart';

@immutable
sealed class SongPlayerState {}

// final class SongPlayerInitial extends SongPlayerState {}

final class SongPlayerLoading extends SongPlayerState {}

final class SongPlayerLoaded extends SongPlayerState {
  final Duration songDuration;
  final Duration songPosition;
  final bool isPlaying;

  SongPlayerLoaded({
    required this.songDuration,
    required this.songPosition,
    required this.isPlaying,
  });
}

class ShuffleSongActiveState extends SongPlayerState {}

class RepeatSongActiveState extends SongPlayerState {}

final class SongPlayerFailure extends SongPlayerState {}
