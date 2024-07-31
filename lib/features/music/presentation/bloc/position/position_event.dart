part of 'position_bloc.dart';

@immutable
sealed class PositionEvent {}

final class SkeepToNextPreviousSongEvent extends PositionEvent {
  int indexPosition;
  SkeepToNextPreviousSongEvent(this.indexPosition);
}

// class RepeatClickedEvent extends PositionEvent {}
