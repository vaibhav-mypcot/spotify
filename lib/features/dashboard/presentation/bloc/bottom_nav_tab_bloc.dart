import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_tab_event.dart';
part 'bottom_nav_tab_state.dart';

class BottomNavTabBloc extends Bloc<BottomNavTabEvent, BottomNavTabState> {
  BottomNavTabBloc() : super(BottomNavTabInitial(0)) {
    on<BottomNavTabClickEvent>(_onBottomNavTabClickEvent);
  }

  _onBottomNavTabClickEvent(
      BottomNavTabClickEvent event, Emitter<BottomNavTabState> emit) {
    emit(BottomNavTabInitial(event.index));
  }
}
