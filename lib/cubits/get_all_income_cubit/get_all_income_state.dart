part of 'get_all_income_cubit.dart';

@immutable
sealed class GetAllIncomeState {}

final class GetAllIncomeInitial extends GetAllIncomeState {}

final class GetAllIncomeLoading extends GetAllIncomeState {}

final class GetAllIncomeSuccess extends GetAllIncomeState {
  int income;
  GetAllIncomeSuccess({required this.income});
}

final class GetAllIncomeFailure extends GetAllIncomeState {
  String errorMessage;
  GetAllIncomeFailure({required this.errorMessage});
}
