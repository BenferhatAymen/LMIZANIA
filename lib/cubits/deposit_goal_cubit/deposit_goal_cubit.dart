import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/deposit_goal_web_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'deposit_goal_state.dart';
class DepositGoalCubit extends Cubit<DepositGoalState> {
  DepositGoalCubit() : super(DepositGoalInitial());

  Future<void> depositGoal({required String id,required int amount}) async {
    var pref = await SharedPreferences.getInstance();

    emit(DepositGoalLoading());

    try {
      var response = await DepositGoalWebServices().depositGoal(id: id,amount: amount);
      emit(DepositGoalSuccess());
    } catch (e) {
      emit(DepositGoalFailure(errorMessage: "Cannot delete"));
    }
  }
}
