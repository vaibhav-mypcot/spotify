part of 'tabs_bloc.dart';

@immutable
sealed class TabsEvent {}

final class TabClickEvent extends TabsEvent {
  TabClickEvent(this.tabIndex);
  final int tabIndex;
}
