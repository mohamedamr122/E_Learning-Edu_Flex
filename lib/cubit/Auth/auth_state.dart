part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginFailedState extends AuthState {
  final String message;

  LoginFailedState({required this.message});
}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {
  final String message;

  RegisterSuccessState({required this.message});

}

final class RegisterFailedState extends AuthState {
  final String message;

  RegisterFailedState({required this.message});
}

final class VerifyLoadingState extends AuthState {}

final class VerifySuccessState extends AuthState {

}

final class VerifyFailedState extends AuthState {
  final String message;

  VerifyFailedState({required this.message});
}
final class ResendOTPLoadingState extends AuthState {}

final class ResendOTPLoadedState extends AuthState {
  final String message;

  ResendOTPLoadedState({required this.message});
}

final class ResendOTPFailedState extends AuthState {
  final String message;

  ResendOTPFailedState({required this.message});
}
final class ForgotPasswordLoadingState extends AuthState {}

final class ForgotPasswordSuccessState extends AuthState {
  final String message;

  ForgotPasswordSuccessState({required this.message});
}

final class ForgotPasswordFailedState extends AuthState {
  final String message;

  ForgotPasswordFailedState({required this.message});
}

final class ResetPasswordLoadingState extends AuthState {}

final class ResetPasswordSuccessState extends AuthState {

}

final class ResetPasswordFailedState extends AuthState {
  final String message;

  ResetPasswordFailedState({required this.message});
}
