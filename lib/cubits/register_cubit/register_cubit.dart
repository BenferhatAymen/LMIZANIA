import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/web_services/register_web_service.dart';
import '../../data/web_services/set_wallet_web_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> RegisterUser(
      {required String email,
      required String password,
      required String fullName}) async {
    var pref = await SharedPreferences.getInstance();

    emit(RegisterLoading());

    try {
      var response = await RegisterWebServices()
          .userRegister(email: email, password: password, fullName: fullName);

      pref.setString("token", response["token"]);
      pref.setString("email", response["user"]["email"]);
      await SetWalletWebServices().setWallet(ammount: 0);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(errorMessage: "invalid data"));
    }
  }
}
