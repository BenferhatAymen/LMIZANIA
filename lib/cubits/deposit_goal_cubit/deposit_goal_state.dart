part of 'deposit_goal_cubit.dart';

@immutable
sealed class DepositGoalState {}

final class DepositGoalInitial extends DepositGoalState {}

final class DepositGoalLoading extends DepositGoalState {}

final class DepositGoalSuccess extends DepositGoalState {}

class DepositGoalFailure extends DepositGoalState {
  String errorMessage;
  DepositGoalFailure({required this.errorMessage});
}
