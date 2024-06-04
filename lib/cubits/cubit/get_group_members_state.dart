part of 'get_group_members_cubit.dart';

@immutable
sealed class GetGroupMembersState {}

final class GetGroupMembersInitial extends GetGroupMembersState {}

final class GetGroupMembersLoading extends GetGroupMembersState {}

final class GetGroupMembersSuccess extends GetGroupMembersState {
  List<String> ids;

  GetGroupMembersSuccess({required this.ids});
}

final class GetGroupMembersFailure extends GetGroupMembersState {
  String errorMessage;
  GetGroupMembersFailure({required this.errorMessage});
}
