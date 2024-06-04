import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/edit_profile_web_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  Future<void> editProfile(
      {required String name,
      required String email,
      required String gender,
      String? image}) async {
    var pref = await SharedPreferences.getInstance();

    emit(EditProfileLoading());

    try {
      var response = await EditProfileWebServices()
          .editProfile(name: name, email: email, gender: gender, image: image);
      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileFailure(errorMessage: "invalid email or password"));
    }
  }
}
