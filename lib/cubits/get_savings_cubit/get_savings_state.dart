part of 'get_savings_cubit.dart';

@immutable
sealed class GetSavingsState {}

final class GetSavingsInitial extends GetSavingsState {}

final class GetSavingsLoading extends GetSavingsState {}

final class GetSavingsSuccess extends GetSavingsState {
  SavingsModel savings;
  GetSavingsSuccess({required this.savings});
}

final class GetSavingsFailure extends GetSavingsState {
  String errorMessage;
  GetSavingsFailure({required this.errorMessage});
}
