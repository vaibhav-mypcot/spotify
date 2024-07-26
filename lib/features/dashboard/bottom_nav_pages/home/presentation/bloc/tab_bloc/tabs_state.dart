part of 'tabs_bloc.dart';

@immutable
sealed class TabsState {}

final class TabsInitial extends TabsState {
  final int index;
  TabsInitial(this.index);
}
