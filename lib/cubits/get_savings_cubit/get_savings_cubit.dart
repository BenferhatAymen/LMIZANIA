import 'package:bloc/bloc.dart';
import 'package:lmizania/data/models/savings_model.dart';
import 'package:lmizania/data/web_services/get_savings_web_service.dart';
import 'package:meta/meta.dart';

part 'get_savings_state.dart';

class GetSavingsCubit extends Cubit<GetSavingsState> {
  GetSavingsCubit() : super(GetSavingsInitial());

  Future<void> getSavings() async {
    emit(GetSavingsLoading());
    try {
      var response = await GetSavingsWebServices().getSavings();
      SavingsModel savings = SavingsModel.fromJson(response['saving']);
      emit(GetSavingsSuccess(savings: savings));
    } catch (e) {
      emit(GetSavingsFailure(errorMessage: "invalid data"));
    }
  }
}
