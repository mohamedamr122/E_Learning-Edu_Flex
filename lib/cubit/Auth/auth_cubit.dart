import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_eduflex/constants/constants.dart';
import 'package:new_eduflex/shared/local_network.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());
      Map<String, String> headers = {'Content-Type': 'application/json'};
      final msg = jsonEncode({
        "email": email,
        "password": password,
      });

      Response response = await http.post(
        Uri.parse('$apiUser/auth/login'),
        headers: headers,
        body: msg,
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data["message"] == "successfully logged in!") {
          CashNetwork.insertToCash(key: 'Token', value: data['token']);
          emit(LoginSuccessState());
        }
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
      required String? stage,
      required String? level}) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final msg = jsonEncode({
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

    emit(RegisterLoadingState());
    Response response = await http.post(Uri.parse('$apiUser/auth/register'),
        headers: headers, body: msg);
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 201) {
        emit(RegisterSuccessState(message: data['message']));
      } else {
        emit(
          RegisterFailedState(message: data['message']),
        );
      }
    } catch (e) {
      emit(RegisterFailedState(message: e.toString()));
    }
  }

  Future<dynamic> verifyEmail(
      {required String email, required String otpCode}) async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      final msg = jsonEncode({
        "email": email,
        "otp": otpCode,
      });
      emit(VerifyLoadingState());
      Response response = await http.post(
          Uri.parse('$apiUser/auth/verify-email'),
          body: msg,
          headers: headers);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(VerifySuccessState());
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
      Map<String, String> headers = {'Content-Type': 'application/json'};
      final msg = jsonEncode({'email': email});
      emit(ResendOTPLoadingState());
      Response response = await http.post(Uri.parse('$apiUser/auth/resend-otp'),
          body: msg, headers: headers);
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
      Map<String, String> headers = {'Content-Type': 'application/json'};
      final msg = jsonEncode({'email': email});
      emit(ForgotPasswordLoadingState());
      Response response = await http.post(
          Uri.parse('$apiUser/auth/forgot-password'),
          body: msg,
          headers: headers);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(ForgotPasswordSuccessState(message: data['message']));
      } else {
        emit(ForgotPasswordFailedState(message: data['message']));
      }
    } catch (e) {
      emit(ForgotPasswordFailedState(message: e.toString()));
    }
  }

  Future<dynamic> resetPassword(
      {required String email,
      required String resetPwOtp,
      required String newPassword,
      required String confirmNewPassword}) async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      final msg = jsonEncode({
        'email': email,
        'resetPwOtp': resetPwOtp,
        'newPassword': newPassword,
        'confirmNewPassword': confirmNewPassword,
      });
      emit(ResetPasswordLoadingState());
      Response response =
          await http.post(Uri.parse('$apiUser/auth/reset-password'), body: msg,headers: headers);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(ResetPasswordSuccessState());
      } else {
        ResetPasswordFailedState(message: data['message']);
      }
    } catch (e) {
      emit(ResetPasswordFailedState(message: e.toString()));
    }
  }
}
