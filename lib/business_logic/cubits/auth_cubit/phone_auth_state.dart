part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class PhoneAuthLoading extends PhoneAuthState {}

final class PhoneAuthFailure extends PhoneAuthState {
  final String errMessage;

  PhoneAuthFailure(this.errMessage);
}

final class PhoneNumberSubmitted extends PhoneAuthState {}

final class PhoneOTPVerified extends PhoneAuthState {}
