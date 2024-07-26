part of 'song_bloc.dart';

@immutable
sealed class SongState {}

final class SongInitial extends SongState {}

final class SongLoading extends SongState {}

final class SongSuccess extends SongState {
  final List<Song> data;
  SongSuccess({required this.data});
}

final class SongFailure extends SongState {
  final String message;
  SongFailure(this.message);
}