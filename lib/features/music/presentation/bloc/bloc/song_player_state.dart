part of 'song_player_bloc.dart';

@immutable
sealed class SongPlayerState {}

// final class SongPlayerInitial extends SongPlayerState {}

final class SongPlayerLoading extends SongPlayerState {}

final class SongPlayerSuccess extends SongPlayerState {}

final class SongPlayerFailure extends SongPlayerState {}
