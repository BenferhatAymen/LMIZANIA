part of 'set_wallet_cubit.dart';

@immutable
sealed class SetWalletState {}

final class SetWalletInitial extends SetWalletState {}

final class SetWalletLoading extends SetWalletState {}

final class SetWalletSuccess extends SetWalletState {}

final class SetWalletFailure extends SetWalletState {
  String errorMessage;
  SetWalletFailure({required this.errorMessage});
}
