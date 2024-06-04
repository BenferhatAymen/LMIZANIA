import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'set_savings_state.dart';

class SetSavingsCubit extends Cubit<SetSavingsState> {
  SetSavingsCubit() : super(SetSavingsInitial());
}
