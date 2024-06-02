import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/set_wallet_web_service.dart';
import 'package:meta/meta.dart';

part 'set_wallet_state.dart';

class SetWalletCubit extends Cubit<SetWalletState> {
  SetWalletCubit() : super(SetWalletInitial());

  Future<void> setWallet({required int ammount}) async {
    emit(SetWalletLoading());
    try {
     await SetWalletWebServices().setWallet(ammount: ammount);
      emit(SetWalletSuccess());
    } catch (e) {
      emit(SetWalletFailure(errorMessage: "invalid data"));
    }
  }
}
