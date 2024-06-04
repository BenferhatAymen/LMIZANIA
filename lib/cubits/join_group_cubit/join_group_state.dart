part of 'join_group_cubit.dart';

@immutable
sealed class JoinGroupState {}

final class JoinGroupInitial extends JoinGroupState {}

final class JoinGroupLoading extends JoinGroupState {}

final class JoinGroupSuccess extends JoinGroupState {}

final class JoinGroupFailure extends JoinGroupState {
  String errorMessage;
  JoinGroupFailure({required this.errorMessage});
}
