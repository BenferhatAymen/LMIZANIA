import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/set_savings_web_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'set_savings_state.dart';

class SetSavingsCubit extends Cubit<SetSavingsState> {
  SetSavingsCubit() : super(SetSavingsInitial());

  Future<void> SetSavings({required int amount}) async {
    var pref = await SharedPreferences.getInstance();

    emit(SetSavingsLoading());

    try {
      var response = await SetSavingsWebServices().setSavings(amount: amount);
      emit(SetSavingsSuccess());
    } catch (e) {
      emit(SetSavingsFailure(errorMessage: "Cannot delete"));
    }
  }
}
