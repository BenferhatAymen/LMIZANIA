part of 'deposit_savings_cubit.dart';

@immutable
sealed class DepositSavingsState {}

final class DepositSavingsInitial extends DepositSavingsState {}

final class DepositSavingsLoading extends DepositSavingsState {}

final class DepositSavingsSuccess extends DepositSavingsState {}

class DepositSavingsFailure extends DepositSavingsState {
  String errorMessage;
  DepositSavingsFailure({required this.errorMessage});
}
