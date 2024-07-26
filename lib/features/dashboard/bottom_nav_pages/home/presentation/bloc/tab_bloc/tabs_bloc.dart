import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tabs_event.dart';
part 'tabs_state.dart';

class TabsBloc extends Bloc<TabsEvent, TabsState> {
  TabsBloc() : super(TabsInitial(0)) {
    on<TabClickEvent>(_onTabClickEvent);
  }

  _onTabClickEvent(TabClickEvent event, Emitter<TabsState> emit) {
    emit(TabsInitial(event.tabIndex));
  }
}
