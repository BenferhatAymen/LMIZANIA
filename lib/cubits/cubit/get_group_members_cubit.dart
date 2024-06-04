import 'package:bloc/bloc.dart';
import 'package:lmizania/cubits/get_all_groups_cubit/get_all_groups_cubit.dart';
import 'package:lmizania/data/web_services/get_all_members_web_service.dart';
import 'package:meta/meta.dart';

part 'get_group_members_state.dart';

class GetGroupMembersCubit extends Cubit<GetGroupMembersState> {
  GetGroupMembersCubit() : super(GetGroupMembersInitial());

  Future<void> getGroupMembers({required String id}) async {
    emit(GetGroupMembersLoading());
    try {
      var response = await GetAllMembersWebServices().getAllMembers(id: id);

      // Assuming the response is a Map with a key 'transactions' containing the list of transactions.
      List<String> ids = response['members'];

      // Mapping each item in transactionsJson to a TransactionModel.

      emit(GetGroupMembersSuccess(ids: ids));
    } catch (e) {
      print(e.toString());
      emit(GetGroupMembersFailure(errorMessage: "Cannot get AllTransactions"));
    }
  }
}
