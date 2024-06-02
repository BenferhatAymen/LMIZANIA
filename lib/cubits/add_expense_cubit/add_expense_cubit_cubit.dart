import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/add_expense_web_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_expense_cubit_state.dart';

class AddExpenseCubit extends Cubit<AddExpenseState> {
  AddExpenseCubit() : super(AddExpenseInitial());

  Future<void> addExpense(
      {required String name,
      required String category,
      required int amount,
      required String date}) async {
    var pref = await SharedPreferences.getInstance();

    emit(AddExpenseLoading());

    try {
      var response = await AddExpenseWebServices().addExpense(
          name: name, category: category, amount: amount, date: date);
      emit(AddExpenseSuccess());
    } catch (e) {
      emit(AddExpenseFailure(errorMessage: "invalid email or password"));
    }
  }
}
