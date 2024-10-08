import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'position_event.dart';
part 'position_state.dart';

class PositionBloc extends Bloc<PositionEvent, PositionState> {
  PositionBloc() : super(PositionInitial()) {
    on<SkeepToNextPreviousSongEvent>(_onSkeepToNextPreviousSongEvent);
    on<ResetPositionEvent>(_onResetPositionEvent);
  }

  _onSkeepToNextPreviousSongEvent(
      SkeepToNextPreviousSongEvent event, Emitter<PositionState> emit) {
    emit(SkeepToNextPreviousSongState(event.indexPosition));
  }

  _onResetPositionEvent(ResetPositionEvent event, Emitter<PositionState> emit) {
    
  }
}
