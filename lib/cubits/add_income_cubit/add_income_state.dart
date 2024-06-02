part of 'add_income_cubit.dart';

@immutable
sealed class AddIncomeState {}

final class AddIncomeInitial extends AddIncomeState {}

final class AddIncomeLoading extends AddIncomeState {}

final class AddIncomeSuccess extends AddIncomeState {}

class AddIncomeFailure extends AddIncomeState {
  String errorMessage;
  AddIncomeFailure({required this.errorMessage});
}
