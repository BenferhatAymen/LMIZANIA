import 'package:bloc/bloc.dart';
import 'package:lmizania/data/web_services/join_group_web_service.dart';
import 'package:meta/meta.dart';

part 'join_group_state.dart';

class JoinGroupCubit extends Cubit<JoinGroupState> {
  JoinGroupCubit() : super(JoinGroupInitial());

  Future<void> JoinGroup({required String id}) async {
    emit(JoinGroupLoading());
    try {
      await JoinGroupWebServices().joinGroup(id: id);
      emit(JoinGroupSuccess());
    } catch (e) {
      emit(JoinGroupFailure(errorMessage: "invalid data"));
    }
  }
}
