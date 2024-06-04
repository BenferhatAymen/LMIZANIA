import 'package:bloc/bloc.dart';
import 'package:lmizania/data/models/user_model.dart';
import 'package:lmizania/data/web_services/get_profile_web_service.dart';
import 'package:meta/meta.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit() : super(GetProfileInitial());

  Future<void> getProfile() async {
    emit(GetProfileLoading());
    try {
      var response = await GetProfileWebServices().getProfile();
      emit(GetProfileSuccess(user: UserModel.fromJson(response["user"])));
    } catch (e) {
      emit(GetProfileFailure(errorMessage: "cannot get wallet"));
    }
  }
}
