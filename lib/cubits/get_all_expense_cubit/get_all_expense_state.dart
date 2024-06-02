part of 'get_all_expense_cubit.dart';

@immutable
sealed class GetAllExpenseState {}

final class GetAllExpenseInitial extends GetAllExpenseState {}

final class GetAllExpenseLoading extends GetAllExpenseState {}

final class GetAllExpenseSuccess extends GetAllExpenseState {
  int expense;
  GetAllExpenseSuccess({required this.expense});
}

final class GetAllExpenseFailure extends GetAllExpenseState {
  String errorMessage;
  GetAllExpenseFailure({required this.errorMessage});
}
