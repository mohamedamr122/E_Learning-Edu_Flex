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

final class RegisterLoadedState extends AuthState {}

final class RegisterFailedState extends AuthState {
  final String message;

  RegisterFailedState({required this.message});
}

final class VerifyLoadingState extends AuthState {}

final class VerifyLoadedState extends AuthState {
  final String message;

  VerifyLoadedState({required this.message});
}

final class VerifyFailedState extends AuthState {
  final String message;

  VerifyFailedState({required this.message});
}
