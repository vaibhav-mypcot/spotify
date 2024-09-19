import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favroite_song_event.dart';
part 'favroite_song_state.dart';

class FavroiteSongBloc extends Bloc<FavroiteSongEvent, FavroiteSongState> {
  FavroiteSongBloc() : super(FavroiteSongState(false)) {
    on<FavroiteSongClickEvent>(_onFavroiteSongClickEvent);
  }

  _onFavroiteSongClickEvent(
      FavroiteSongClickEvent event, Emitter<FavroiteSongState> emit) {
    emit(FavroiteSongState(event.isFavroite));
  }
}
