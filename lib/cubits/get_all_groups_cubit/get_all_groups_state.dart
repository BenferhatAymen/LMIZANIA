part of 'get_all_groups_cubit.dart';

@immutable
sealed class GetAllGroupsState {}

final class GetAllGroupsInitial extends GetAllGroupsState {}

final class GetAllGroupsLoading extends GetAllGroupsState {}

final class GetAllGroupsSuccess extends GetAllGroupsState {
  List<GroupModel> groups;

  GetAllGroupsSuccess({required this.groups});
}

final class GetAllGroupsFailure extends GetAllGroupsState {
  String errorMessage;
  GetAllGroupsFailure({required this.errorMessage});
}
