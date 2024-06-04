part of 'create_group_cubit.dart';

@immutable
sealed class CreateGroupState {}

final class CreateGroupInitial extends CreateGroupState {}

final class CreateGroupLoading extends CreateGroupState {}

final class CreateGroupSuccess extends CreateGroupState {}

final class CreateGroupFailure extends CreateGroupState {
  String errorMessage;
  CreateGroupFailure({required this.errorMessage});
}
