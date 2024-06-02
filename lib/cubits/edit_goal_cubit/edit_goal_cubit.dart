// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// part 'edit_goal_state.dart';
// class EditGoalCubit extends Cubit<EditGoalState> {
//   EditGoalCubit() : super(EditGoalInitial());

//   Future<void> EditGoal({required String id}) async {
//     var pref = await SharedPreferences.getInstance();

//     emit(EditGoalLoading());

//     try {
//       var response = await EditGoalWebServices().EditGoal(id: id);
//       emit(EditGoalSuccess());
//     } catch (e) {
//       emit(EditGoalFailure(errorMessage: "Cannot delete"));
//     }
//   }
// }
 