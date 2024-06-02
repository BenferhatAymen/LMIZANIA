import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/login_web_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> LoginUser(
      {required String email, required String password}) async {
    var pref = await SharedPreferences.getInstance();

    emit(LoginLoading());

    try {
      var response =
          await LoginWebServices().userLogin(email: email, password: password);
      pref.setString("token", response["token"]);
      pref.setString("email", response["user"]["email"]);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(errorMessage: "invalid email or password"));
    }
  }
}
