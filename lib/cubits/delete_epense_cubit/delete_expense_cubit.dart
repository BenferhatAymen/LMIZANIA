import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/delete_expense_web_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'delete_expense_state.dart';

class DeleteExpenseCubit extends Cubit<DeleteExpenseState> {
  DeleteExpenseCubit() : super(DeleteExpenseInitial());

  Future<void> deleteExpense({required String id}) async {
    var pref = await SharedPreferences.getInstance();

    emit(DeleteExpenseLoading());

    try {
      var response = await DeleteExpenseWebServices().deleteExpense(id: id);
      emit(DeleteExpenseSuccess());
    } catch (e) {
      emit(DeleteExpenseFailure(errorMessage: "Cannot delete"));
    }
  }
}
