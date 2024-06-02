part of 'add_expense_cubit_cubit.dart';

@immutable
sealed class AddExpenseState {}

final class AddExpenseInitial extends AddExpenseState {}

final class AddExpenseLoading extends AddExpenseState {}

final class AddExpenseSuccess extends AddExpenseState {}

class AddExpenseFailure extends AddExpenseState {
  String errorMessage;
  AddExpenseFailure({required this.errorMessage});
}
