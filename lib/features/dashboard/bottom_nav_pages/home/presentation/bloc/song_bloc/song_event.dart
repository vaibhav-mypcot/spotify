part of 'song_bloc.dart';

@immutable
sealed class SongEvent {}

class SongFetchEvent extends SongEvent {}
