part of 'courses_cubit.dart';

@immutable
sealed class CoursesState {}

final class CoursesInitial extends CoursesState {}

final class CreateCourseLoading extends CoursesState {}

final class CreateCourseLoaded extends CoursesState {}

final class CreateCourseFailed extends CoursesState {
  final String message;

  CreateCourseFailed({required this.message});
}

final class GetAllCoursesLoading extends CoursesState {}

final class GetAllCoursesLoaded extends CoursesState {
    final List courses;

  GetAllCoursesLoaded({required this.courses});
}

final class GetAllCoursesFailed extends CoursesState {
  final String message;

  GetAllCoursesFailed({required this.message});
}

final class GetCurrentUserCoursesLoading extends CoursesState {}

final class GetCurrentUserCoursesLoaded extends CoursesState {}

final class GetCurrentUserCoursesFailed extends CoursesState {
  final String message;

  GetCurrentUserCoursesFailed({required this.message});
}

final class SearchCoursesLoading extends CoursesState {}

final class SearchCoursesLoaded extends CoursesState {}

final class SearchCoursesFailed extends CoursesState {
  final String message;

  SearchCoursesFailed({required this.message});
}

final class GetSingleCourseLoading extends CoursesState {}

final class GetSingleCourseLoaded extends CoursesState {}

final class GetSingleCourseFailed extends CoursesState {
  final String message;

  GetSingleCourseFailed({required this.message});
}

final class UpdateCourseLoading extends CoursesState {}

final class UpdateCourseLoaded extends CoursesState {}

final class UpdateCourseFailed extends CoursesState {
  final String message;

  UpdateCourseFailed({required this.message});
}

final class EnrollInCourseLoading extends CoursesState {}

final class EnrollInCourseLoaded extends CoursesState {}

final class EnrollInCourseFailed extends CoursesState {
  final String message;

  EnrollInCourseFailed({required this.message});
}

final class GetCourseEnrollmentsLoading extends CoursesState {}

final class GetCourseEnrollmentsLoaded extends CoursesState {}

final class GetCourseEnrollmentsFailed extends CoursesState {
  final String message;

  GetCourseEnrollmentsFailed({required this.message});
}

final class AddSectionsToCourseLoading extends CoursesState {}

final class AddSectionsToCourseLoaded extends CoursesState {}

final class AddSectionsToCourseFailed extends CoursesState {
  final String message;

  AddSectionsToCourseFailed({required this.message});
}

final class UpdateSectionTitleLoading extends CoursesState {}

final class UpdateSectionTitleLoaded extends CoursesState {}

final class UpdateSectionTitleFailed extends CoursesState {
  final String message;

  UpdateSectionTitleFailed({required this.message});
}

final class DeleteSectionFromCourseLoading extends CoursesState {}

final class DeleteSectionFromCourseLoaded extends CoursesState {}

final class DeleteSectionFromCourseFailed extends CoursesState {
  final String message;

  DeleteSectionFromCourseFailed({required this.message});
}

final class AddVideoToSectionLoading extends CoursesState {}

final class AddVideoToSectionLoaded extends CoursesState {}

final class AddVideoToSectionFailed extends CoursesState {
  final String message;

  AddVideoToSectionFailed({required this.message});
}

final class UpdateVideoInfoLoading extends CoursesState {}

final class UpdateVideoInfoLoaded extends CoursesState {}

final class UpdateVideoInfoFailed extends CoursesState {
  final String message;

  UpdateVideoInfoFailed({required this.message});
}

final class DeleteVideoLoading extends CoursesState {}

final class DeleteVideoLoaded extends CoursesState {}

final class DeleteVideoFailed extends CoursesState {
  final String message;

  DeleteVideoFailed({required this.message});
}
