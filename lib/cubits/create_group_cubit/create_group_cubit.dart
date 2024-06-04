import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/create_group_web_service.dart';
import 'package:meta/meta.dart';

part 'create_group_state.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit() : super(CreateGroupInitial());

  Future<void> createGroup(
      {required String name, required String image}) async {
    emit(CreateGroupLoading());
    try {
      await CreateGroupWebServices().createGroup(name: name, image: image);
      emit(CreateGroupSuccess());
    } catch (e) {
      emit(CreateGroupFailure(errorMessage: "invalid data"));
    }
  }
}
