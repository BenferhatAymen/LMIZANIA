part of 'get_all_transactions_cubit.dart';

@immutable
sealed class GetAllTransactionsState {}

final class GetAllTransactionsInitial extends GetAllTransactionsState {}

final class GetAllTransactionsLoading extends GetAllTransactionsState {}

final class GetAllTransactionsSuccess extends GetAllTransactionsState {
  List<TransactionModel> transactions;

  GetAllTransactionsSuccess({required this.transactions});
}

final class GetAllTransactionsFailure extends GetAllTransactionsState {
  String errorMessage;
  GetAllTransactionsFailure({required this.errorMessage});
}
