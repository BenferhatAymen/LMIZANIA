import 'package:bloc/bloc.dart';
import 'package:lmizania/data/models/transaction_models.dart';
import 'package:lmizania/data/web_services/get_all_transactions_web_service.dart';
import 'package:meta/meta.dart';

part 'get_all_transactions_state.dart';

class GetAllTransactionsCubit extends Cubit<GetAllTransactionsState> {
  GetAllTransactionsCubit() : super(GetAllTransactionsInitial());

  Future<void> getAllTransactions() async {
    emit(GetAllTransactionsLoading());
    try {
      var response = await GetAllTransactionsWebServices().getAllTransactions();

      // Assuming the response is a Map with a key 'transactions' containing the list of transactions.
      List<dynamic> transactionsJson = response['transactions'];

      // Mapping each item in transactionsJson to a TransactionModel.
      List<TransactionModel> transactions = transactionsJson
          .map((transaction) => TransactionModel.fromJson(transaction))
          .toList();

      emit(GetAllTransactionsSuccess(transactions: transactions));
    } catch (e) {
      print(e.toString());
      emit(GetAllTransactionsFailure(
          errorMessage: "Cannot get AllTransactions"));
    }
  }
}
