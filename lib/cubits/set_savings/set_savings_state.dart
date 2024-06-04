part of 'set_savings_cubit.dart';

@immutable
sealed class SetSavingsState {}

final class SetSavingsInitial extends SetSavingsState {}

final class SetSavingsLoading extends SetSavingsState {}

final class SetSavingsSuccess extends SetSavingsState {}

class SetSavingsFailure extends SetSavingsState {
  String errorMessage;
  SetSavingsFailure({required this.errorMessage});
}
