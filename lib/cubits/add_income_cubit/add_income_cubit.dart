import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/add_income_web_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_income_state.dart';

class AddIncomeCubit extends Cubit<AddIncomeState> {
  AddIncomeCubit() : super(AddIncomeInitial());

  Future<void> addIncome(
      {required String name,
      required String category,
      required int amount,
      required String date}) async {
    var pref = await SharedPreferences.getInstance();

    emit(AddIncomeLoading());

    try {
      var response = await AddIncomeWebServices().addIncome(
          name: name, category: category, amount: amount, date: date);
      emit(AddIncomeSuccess());
    } catch (e) {
      emit(AddIncomeFailure(errorMessage: "invalid email or password"));
    }
  }
}
