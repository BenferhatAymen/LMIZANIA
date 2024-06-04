import 'package:bloc/bloc.dart';
import 'package:lmizania/data/models/group_model.dart';
import 'package:lmizania/data/web_services/get_all_groups_web_service.dart';
import 'package:meta/meta.dart';

part 'get_all_groups_state.dart';

class GetAllGroupsCubit extends Cubit<GetAllGroupsState> {
  GetAllGroupsCubit() : super(GetAllGroupsInitial());

  Future<void> getAllGroups() async {
    emit(GetAllGroupsLoading());
    try {
      var response = await GetAllGroupsWebServices().getAllGroups();

      // Assuming the response is a Map with a key 'Groups' containing the list of Groups.
      List<dynamic> groupsJson = response['groups'];

      // Mapping each item in GroupsJson to a GroupModel.
      List<GroupModel> groups =
          groupsJson.map((group) => GroupModel.fromJson(group)).toList();

      emit(GetAllGroupsSuccess(groups: groups));
    } catch (e) {
      print(e.toString());
      emit(GetAllGroupsFailure(errorMessage: "Cannot get AllGroups"));
    }
  }
}
