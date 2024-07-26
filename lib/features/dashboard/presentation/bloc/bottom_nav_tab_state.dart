part of 'bottom_nav_tab_bloc.dart';

@immutable
sealed class BottomNavTabState {}

final class BottomNavTabInitial extends BottomNavTabState {
  int index;
  BottomNavTabInitial(this.index);
}

// final class BottomNavTabIndexState extends BottomNavTabState {
//   int index;
//   BottomNavTabIndexState(this.index);
// }
