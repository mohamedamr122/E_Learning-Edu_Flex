import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  String apiUser = 'https://eduflex-0o5p.onrender.com/api/v1';
  AuthCubit() : super(AuthInitial());
  void login({
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

  void register(
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

  void verifyEmail({required String email, required String otp}) async {
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
}
