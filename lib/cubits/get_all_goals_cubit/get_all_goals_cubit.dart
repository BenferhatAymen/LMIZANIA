import 'package:bloc/bloc.dart';
import 'package:lmizania/data/models/goal_model.dart';
import 'package:lmizania/data/web_services/get_all_goals.dart';
import 'package:meta/meta.dart';

part 'get_all_goals_state.dart';

class GetAllGoalsCubit extends Cubit<GetAllGoalsState> {
  GetAllGoalsCubit() : super(GetAllGoalsInitial());

  Future<void> getAllGoals() async {
    emit(GetAllGoalsLoading());
    try {
      var response = await GetAllGoalsWebServices().getAllGoals();

      // Assuming the response is a Map with a key 'transactions' containing the list of transactions.
      List<dynamic> goalsJson = response['goals'];

      // Mapping each item in transactionsJson to a TransactionModel.
      List<GoalModel> goals = goalsJson
          .map((goal) => GoalModel.fromJson(goal))
          .toList();

      emit(GetAllGoalsSuccess(goals: goals));
    } catch (e) {
      print(e.toString());
      emit(GetAllGoalsFailure(errorMessage: "Cannot get AllGoals"));
    }
  }
}
