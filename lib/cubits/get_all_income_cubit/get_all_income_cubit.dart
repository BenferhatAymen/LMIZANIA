import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/get_all_income_web_service.dart';
import 'package:meta/meta.dart';

part 'get_all_income_state.dart';

class GetAllIncomeCubit extends Cubit<GetAllIncomeState> {
  GetAllIncomeCubit() : super(GetAllIncomeInitial());

  Future<void> GetAllIncome() async {
    emit(GetAllIncomeLoading());
    try {
      var response = await GetAllIncomeWebServices().getAllIncome();
      emit(GetAllIncomeSuccess(income: response["totalIncome"]));
    } catch (e) {
      emit(GetAllIncomeFailure(errorMessage: "cannot get wallet"));
    }
  }
}
