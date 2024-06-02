part of 'get_wallet_cubit.dart';

@immutable
sealed class GetWalletState {}

final class GetWalletInitial extends GetWalletState {}

final class GetWalletLoading extends GetWalletState {}

final class GetWalletSuccess extends GetWalletState {
  int balance;
  GetWalletSuccess({required this.balance});
}

final class GetWalletFailure extends GetWalletState {
  String errorMessage;
  GetWalletFailure({required this.errorMessage});
}
