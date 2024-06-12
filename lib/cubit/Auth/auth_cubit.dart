import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_eduflex/constants/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());
      Response response = await http.post(
        Uri.parse('$apiUser/auth/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(LoginSuccessState());
      } else {
        emit(LoginFailedState(message: data['message']));
      }
    } catch (e) {
      emit(LoginFailedState(message: e.toString()));
    }
  }

  Future<dynamic> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String confirmPassword,
      required String role,
      required String education,
      required String stage,
      required String level}) async {
    emit(RegisterLoadingState());
    Response response =
        await http.post(Uri.parse('$apiUser/auth/register'), body: {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'role': role,
      'education': education,
      'stage': stage,
      'level': level,
    });
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        emit(RegisterLoadedState());
      } else {
        emit(
          RegisterFailedState(message: data['message']),
        );
      }
    } catch (e) {
      emit(RegisterFailedState(message: e.toString()));
    }
  }

  Future<dynamic> verifyEmail({required String email, required String otp}) async {
    try {
      emit(VerifyLoadingState());
      Response response =
          await http.post(Uri.parse('$apiUser/auth/verify-email'), body: {
        "email": email,
        "otp": otp,
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(VerifyLoadedState(message: data['otp']));
      } else {
        emit(VerifyFailedState(message: data['message']));
      }
    } catch (e) {
      emit(
        VerifyFailedState(message: e.toString()),
      );
    }
  }

  Future<dynamic> resendOTP({required String email}) async {
    try {
      emit(ResendOTPLoadingState());
      Response response = await http
          .post(Uri.parse('$apiUser/auth/resend-otp'), body: {'email': email});
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(ResendOTPLoadedState(message: data));
      }
    } catch (e) {
      emit(ResendOTPFailedState(message: e.toString()));
    }
  }

  Future<dynamic> forgotPassword({required String email}) async {
    try {
      emit(ForgotPasswordLoadingState());
      Response response = await http.post(
          Uri.parse('$apiUser/auth/forgot-password'),
          body: {'email': email});
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(ForgotPasswordLoadedState(message: data));
      } else {
        emit(ForgotPasswordFailedState(message: data['message']));
      }
    } catch (e) {
      emit(ForgotPasswordFailedState(message: e.toString()));
    }
  }

  Future<dynamic> resetPassword(
      {required String email,
      required String resetPasswordOtp,
      required String newPassword,
      required String confirmNewPassword}) async {
    try {
      emit(ResetPasswordLoadingState());
      Response response =
          await http.post(Uri.parse('$apiUser/auth/reset-password'), body: {
        'email': email,
        'resetPwOtp': resetPasswordOtp,
        'newPassword': newPassword,
        'confirmNewPassword': confirmNewPassword,
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(ResetPasswordLoadedState());
      } else {
        ResetPasswordFailedState(message: data['message']);
      }
    } catch (e) {
      emit(ResetPasswordFailedState(message: e.toString()));
    }
  }
}
