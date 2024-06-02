import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/add_goal_web_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_goal_state.dart';

class AddGoalCubit extends Cubit<AddGoalState> {
  AddGoalCubit() : super(AddGoalInitial());

  Future<void> addGoal(
      {required String name,
      required String description,
      required int targetAmount,
      required String image}) async {
    var pref = await SharedPreferences.getInstance();

    emit(AddGoalLoading());

    try {
      var response = await AddGoalWebServices().addGoal(
          name: name,
          description: description,
          targetAmount: targetAmount,
          image: image);
      emit(AddGoalSuccess());
    } catch (e) {
      emit(AddGoalFailure(errorMessage: "invalid email or password"));
    }
  }
}
