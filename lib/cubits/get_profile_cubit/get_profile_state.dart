part of 'get_profile_cubit.dart';

@immutable
sealed class GetProfileState {}

final class GetProfileInitial extends GetProfileState {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileSuccess extends GetProfileState {
  UserModel user;
  GetProfileSuccess({required this.user});
}

final class GetProfileFailure extends GetProfileState {
  String errorMessage;
  GetProfileFailure({required this.errorMessage});
}
