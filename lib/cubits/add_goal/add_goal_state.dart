part of 'add_goal_cubit.dart';

@immutable
sealed class AddGoalState {}

final class AddGoalInitial extends AddGoalState {}

final class AddGoalLoading extends AddGoalState {}

final class AddGoalSuccess extends AddGoalState {}

class AddGoalFailure extends AddGoalState {
  String errorMessage;
  AddGoalFailure({required this.errorMessage});
}
