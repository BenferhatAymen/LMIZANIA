part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}


final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {}

class EditProfileFailure extends EditProfileState {
  String errorMessage;
  EditProfileFailure({required this.errorMessage});
}
