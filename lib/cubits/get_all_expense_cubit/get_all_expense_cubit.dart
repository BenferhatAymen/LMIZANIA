import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/get_all_expense_web_service.dart';
import 'package:meta/meta.dart';

part 'get_all_expense_state.dart';
class GetAllExpenseCubit extends Cubit<GetAllExpenseState> {
  GetAllExpenseCubit() : super(GetAllExpenseInitial());

  Future<void> GetAllExpense() async {
    emit(GetAllExpenseLoading());
    try {
      var response = await GetAllExpenseWebServices().getAllExpense();
      emit(GetAllExpenseSuccess(expense: response["totalExpense"]));
    } catch (e) {
      emit(GetAllExpenseFailure(errorMessage: "cannot get wallet"));
    }
  }
}
