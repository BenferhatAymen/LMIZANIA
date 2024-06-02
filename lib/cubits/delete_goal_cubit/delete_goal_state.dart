part of 'delete_goal_cubit.dart';

@immutable
sealed class DeleteGoalState {}

final class DeleteGoalInitial extends DeleteGoalState {}

final class DeleteGoalLoading extends DeleteGoalState {}

final class DeleteGoalSuccess extends DeleteGoalState {}

class DeleteGoalFailure extends DeleteGoalState {
  String errorMessage;
  DeleteGoalFailure({required this.errorMessage});
}
