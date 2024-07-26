import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/entities/song.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/usecases/get_all_songs.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final GetAllSongs _getAllSongs;
  SongBloc({required GetAllSongs getAllSongs})
      : _getAllSongs = getAllSongs,
        super(SongInitial()) {
    on<SongFetchEvent>(_onSongFetchEvent);
  }

  _onSongFetchEvent(SongFetchEvent event, Emitter<SongState> emit) async {
    emit(SongLoading());

    var res = await _getAllSongs(NoParams());
    res.fold(
      (l) {
        print("Got exception:  ${l.messaage}");
        emit(SongFailure(l.messaage));
      },
      (data) => emit(
        SongSuccess(data: data),
        // SongLoading(),
      ),
    );
  }
}
