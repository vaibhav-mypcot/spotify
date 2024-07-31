import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'position_event.dart';
part 'position_state.dart';

class PositionBloc extends Bloc<PositionEvent, PositionState> {
  PositionBloc() : super(PositionInitial()) {
    on<SkeepToNextPreviousSongEvent>(_onSkeepToNextPreviousSongEvent);
  }

  _onSkeepToNextPreviousSongEvent(
      SkeepToNextPreviousSongEvent event, Emitter<PositionState> emit) {
    emit(SkeepToNextPreviousSongState(event.indexPosition));
  }
}
