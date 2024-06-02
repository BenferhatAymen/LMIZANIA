part of 'delete_expense_cubit.dart';

@immutable
sealed class DeleteExpenseState {}


final class DeleteExpenseInitial extends DeleteExpenseState {}

final class DeleteExpenseLoading extends DeleteExpenseState {}

final class DeleteExpenseSuccess extends DeleteExpenseState {}

class DeleteExpenseFailure extends DeleteExpenseState {
  String errorMessage;
  DeleteExpenseFailure({required this.errorMessage});
}



