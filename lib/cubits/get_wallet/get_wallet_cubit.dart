import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/get_wallet_web_service.dart';
import 'package:meta/meta.dart';

part 'get_wallet_state.dart';

class GetWalletCubit extends Cubit<GetWalletState> {
  GetWalletCubit() : super(GetWalletInitial());

  Future<void> getWallet() async {
    emit(GetWalletLoading());
    try {
      var response = await GetWalletWebServices().getWallet();
      emit(GetWalletSuccess(balance: response["amount"]));
    } catch (e) {
      emit(GetWalletFailure(errorMessage: "cannot get wallet"));
    }
  }
}
