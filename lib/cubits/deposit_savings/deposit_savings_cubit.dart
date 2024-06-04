import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/deposit_savings_web_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'deposit_savings_state.dart';

class DepositSavingsCubit extends Cubit<DepositSavingsState> {
  DepositSavingsCubit() : super(DepositSavingsInitial());

  Future<void> DepositSavings({ required int amount}) async {
    var pref = await SharedPreferences.getInstance();

    emit(DepositSavingsLoading());

    try {
      var response =
          await DepositSavingsWebServices().depositSavings(amount: amount);
      emit(DepositSavingsSuccess());
    } catch (e) {
      emit(DepositSavingsFailure(errorMessage: "Cannot delete"));
    }
  }
}
