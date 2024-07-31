part of 'position_bloc.dart';

@immutable
sealed class PositionState {}

final class PositionInitial extends PositionState {}

final class SkeepToNextPreviousSongState extends PositionState {
  int indexPosition;
  SkeepToNextPreviousSongState(this.indexPosition);
}