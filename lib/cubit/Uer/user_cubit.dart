import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:new_eduflex/constants/constants.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  Future<dynamic> getAllUsers() async {
    try {
      emit(GetAllUsersLoading());
      Response response = await http.get(Uri.parse('$apiUser/users'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(GetAllUsersLoaded());
      } else {
        emit(GetAllUsersFailed(message: data['message']));
      }
    } catch (e) {
      emit(GetAllUsersFailed(message: e.toString()));
    }
  }

  Future<dynamic> showMeUser() async {
    try {
      emit(ShowMeUserLoading());
      Response response = await http.get(Uri.parse('$apiUser/users/show-me'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(ShowMeUserLoaded());
      } else {
        emit(ShowMeUserFailed(message: data['message']));
      }
    } catch (e) {
      emit(ShowMeUserFailed(message: e.toString()));
    }
  }

  Future<dynamic> usersID(String id) async {
    try {
      emit(UsersIDLoading());
      Response response = await http.get(Uri.parse('$apiUser/users/$id'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(UsersIDLoaded());
      } else {
        emit(UsersIDFailed(message: data['message']));
      }
    } catch (e) {
      emit(UsersIDFailed(message: e.toString()));
    }
  }

  Future<dynamic> updateUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String education,
      required String stage}) async {
    try {
      emit(UpdateUserLoading());
      Response response =
          await http.patch(Uri.parse('$apiUser/users/update-user'), body: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'education': education,
        'stage': stage,
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(UpdateUserLoaded());
      } else {
        emit(UpdateUserFailed(message: data['message']));
      }
    } catch (e) {
      emit(UpdateUserFailed(message: e.toString()));
    }
  }

  Future<dynamic> changeUserPassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmNewPassword}) async {
    try {
      emit(ChangeUserPasswordLoading());
      Response response = await http
          .patch(Uri.parse('$apiUser/users/change-user-password'), body: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'confirmNewPassword': newPassword,
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(ChangeUserPasswordLoaded());
      } else {
        emit(ChangeUserPasswordFailed(message: data['message']));
      }
    } catch (e) {
      emit(ChangeUserPasswordFailed(message: e.toString()));
    }
  }

  Future<dynamic> getUsersWishlist() async {
    try {
      emit(GetUsersWishListLoading());
      Response response = await http.get(Uri.parse('$apiUser/users/wish-list'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(GetUsersWishListLoaded());
      } else {
        emit(GetUsersWishListFailed(message: data['message']));
      }
    } catch (e) {
      emit(GetUsersWishListFailed(message: e.toString()));
    }
  }

  Future<dynamic> patchUsersWishlist({required String courseId}) async {
    try {
      emit(PatchUsersWishListLoading());
      Response response =
          await http.patch(Uri.parse('$apiUser/users/wish-list'), body: {
        'courseId': courseId,
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(PatchUsersWishListLoaded());
      } else {
        emit(PatchUsersWishListFailed(message: data['message']));
      }
    } catch (e) {
      emit(PatchUsersWishListFailed(message: e.toString()));
    }
  }

  Future<dynamic> uploadProfilePicture() async {
    try {
      emit(UploadProfilePictureLoading());
      Response response =
          await http.patch(Uri.parse('$apiUser/users/upload-profile-picture'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(UpdateUserLoaded());
      } else {
        emit(UploadProfilePictureFailed(message: data['message']));
      }
    } catch (e) {
      emit(UploadProfilePictureFailed(message: e.toString()));
    }
  }
}
