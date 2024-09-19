part of 'favroite_song_bloc.dart';

@immutable
sealed class FavroiteSongEvent {}

final class FavroiteSongClickEvent extends FavroiteSongEvent {
  bool isFavroite;
  FavroiteSongClickEvent(this.isFavroite);
}
