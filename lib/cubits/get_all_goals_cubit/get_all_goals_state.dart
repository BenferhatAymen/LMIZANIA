part of 'get_all_goals_cubit.dart';

@immutable
sealed class GetAllGoalsState {}

final class GetAllGoalsInitial extends GetAllGoalsState {}

final class GetAllGoalsLoading extends GetAllGoalsState {}

final class GetAllGoalsSuccess extends GetAllGoalsState {
  List<GoalModel> goals;
  GetAllGoalsSuccess({required this.goals});
}

final class GetAllGoalsFailure extends GetAllGoalsState {
  String errorMessage;
  GetAllGoalsFailure({required this.errorMessage});
}
