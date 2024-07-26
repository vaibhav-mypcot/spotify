part of 'bottom_nav_tab_bloc.dart';

@immutable
sealed class BottomNavTabEvent {}

final class BottomNavTabClickEvent extends BottomNavTabEvent {
  int index;
  BottomNavTabClickEvent(this.index);
}
