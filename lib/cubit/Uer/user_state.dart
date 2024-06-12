part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class GetAllUsersLoading extends UserState {}

final class GetAllUsersLoaded extends UserState {}

final class GetAllUsersFailed extends UserState {
  final String message;

  GetAllUsersFailed({required this.message});
}

final class ShowMeUserLoading extends UserState {}

final class ShowMeUserLoaded extends UserState {}

final class ShowMeUserFailed extends UserState {
  final String message;

  ShowMeUserFailed({required this.message});
}

final class UsersIDLoading extends UserState {}

final class UsersIDLoaded extends UserState {}

final class UsersIDFailed extends UserState {
  final String message;

  UsersIDFailed({required this.message});
}

final class UpdateUserLoading extends UserState {}

final class UpdateUserLoaded extends UserState {}

final class UpdateUserFailed extends UserState {
  final String message;

  UpdateUserFailed({required this.message});
}

final class ChangeUserPasswordLoading extends UserState {}

final class ChangeUserPasswordLoaded extends UserState {}

final class ChangeUserPasswordFailed extends UserState {
  final String message;

  ChangeUserPasswordFailed({required this.message});
}

final class GetUsersWishListLoading extends UserState {}

final class GetUsersWishListLoaded extends UserState {}

final class GetUsersWishListFailed extends UserState {
  final String message;

  GetUsersWishListFailed({required this.message});
}
final class PatchUsersWishListLoading extends UserState {}

final class PatchUsersWishListLoaded extends UserState {}

final class PatchUsersWishListFailed extends UserState {
  final String message;

  PatchUsersWishListFailed({required this.message});
}
final class UploadProfilePictureLoading extends UserState {}

final class UploadProfilePictureLoaded extends UserState {}

final class UploadProfilePictureFailed extends UserState {
  final String message;

  UploadProfilePictureFailed({required this.message});
}
