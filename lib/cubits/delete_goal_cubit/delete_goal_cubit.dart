import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/delete_goal_web_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'delete_goal_state.dart';


class DeleteGoalCubit extends Cubit<DeleteGoalState> {
  DeleteGoalCubit() : super(DeleteGoalInitial());

  Future<void> deleteGoal({required String id}) async {
    var pref = await SharedPreferences.getInstance();

    emit(DeleteGoalLoading());

    try {
      var response = await DeleteGoalWebServices().deleteGoal(id: id);
      emit(DeleteGoalSuccess());
    } catch (e) {
      emit(DeleteGoalFailure(errorMessage: "Cannot delete"));
    }
  }
}
