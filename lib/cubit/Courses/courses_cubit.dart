import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:new_eduflex/constants/constants.dart';
import 'package:new_eduflex/models/course_info_model.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());
  Future<dynamic> createCourse() async {
    try {
      emit(CreateCourseLoading());
      Response response = await http.post(Uri.parse('$apiUser/courses'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(CreateCourseLoaded());
      } else {
        emit(CreateCourseFailed(message: data['message']));
      }
    } catch (e) {
      emit(CreateCourseFailed(message: e.toString()));
    }
  }

  Future<dynamic> getAllCourses() async {
    try {
      emit(GetAllCoursesLoading());
      Response response = await http.get(Uri.parse('$apiUser/courses'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(GetAllCoursesLoaded(courses: data));
      } else {
        emit(GetAllCoursesFailed(message: data['message']));
      }
    } catch (e) {
      emit(GetAllCoursesFailed(message: e.toString()));
    }
  }

  Future<dynamic> getCurrentUserCourses() async {
    try {
      emit(GetCurrentUserCoursesLoading());
      Response response =
          await http.get(Uri.parse('$apiUser/courses/my-courses'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(GetCurrentUserCoursesLoaded());
      } else {
        emit(GetCurrentUserCoursesFailed(message: data['message']));
      }
    } catch (e) {
      emit(GetCurrentUserCoursesFailed(message: e.toString()));
    }
  }

  Future<dynamic> searchCourses() async {
    try {
      emit(SearchCoursesLoading());
      Response response =
          await http.get(Uri.parse('$apiUser/courses/search-by-category'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(SearchCoursesLoaded());
      } else {
        emit(SearchCoursesFailed(message: data['message']));
      }
    } catch (e) {
      emit(SearchCoursesFailed(message: e.toString()));
    }
  }

  Future<dynamic> getSingleCourse(String id) async {
    try {
      emit(GetSingleCourseLoading());
      Response response = await http.get(Uri.parse('$apiUser/courses/$id'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(GetSingleCourseLoaded());
      } else {
        emit(GetSingleCourseFailed(message: data['message']));
      }
    } catch (e) {
      emit(GetSingleCourseFailed(message: e.toString()));
    }
  }

  Future<dynamic> updateCourse(String id, {required int price}) async {
    try {
      emit(UpdateCourseLoading());
      Response response = await http
          .patch(Uri.parse('$apiUser/courses/$id'), body: {'price': price});
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(UpdateCourseLoaded());
      } else {
        emit(UpdateCourseFailed(message: data['message']));
      }
    } catch (e) {
      emit(UpdateCourseFailed(message: e.toString()));
    }
  }

  Future<dynamic> enrollInCourse(String id) async {
    try {
      emit(EnrollInCourseLoading());
      Response response =
          await http.post(Uri.parse('$apiUser/courses/$id/enroll'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(EnrollInCourseLoaded());
      } else {
        emit(EnrollInCourseFailed(message: data['message']));
      }
    } catch (e) {
      emit(EnrollInCourseFailed(message: e.toString()));
    }
  }

  Future<dynamic> getCourseEnrollments(String id) async {
    try {
      emit(GetCourseEnrollmentsLoading());
      Response response =
          await http.get(Uri.parse('$apiUser/courses/$id/enrollments'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(GetCourseEnrollmentsLoaded());
      } else {
        emit(GetCourseEnrollmentsFailed(message: data['message']));
      }
    } catch (e) {
      emit(GetCourseEnrollmentsFailed(message: e.toString()));
    }
  }

  Future<dynamic> addSectionToCourse(String id,
      {required String sectionTitle}) async {
    try {
      emit(AddSectionsToCourseLoading());
      Response response = await http.post(
          Uri.parse('$apiUser/courses/$id/sections'),
          body: {'sectionTitle': sectionTitle});
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(AddSectionsToCourseLoaded());
      } else {
        emit(AddSectionsToCourseFailed(message: data['message']));
      }
    } catch (e) {
      emit(AddSectionsToCourseFailed(message: e.toString()));
    }
  }

  Future<dynamic> updateSectionTitle(String id, String selectionIndex,
      {required String sectionTitle}) async {
    try {
      emit(UpdateSectionTitleLoading());
      Response response = await http.patch(
          Uri.parse('$apiUser/courses/$id/sections/$selectionIndex'),
          body: {'sectionTitle': sectionTitle});
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(UpdateSectionTitleLoaded());
      } else {
        emit(UpdateSectionTitleFailed(message: data['message']));
      }
    } catch (e) {
      emit(UpdateSectionTitleFailed(message: e.toString()));
    }
  }

  Future<dynamic> deleteSectionFromCourse(
      String id, String selectionIndex) async {
    try {
      emit(DeleteSectionFromCourseLoading());
      Response response = await http
          .delete(Uri.parse('$apiUser/courses/$id/sections/$selectionIndex'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(DeleteSectionFromCourseLoaded());
      } else {
        emit(DeleteSectionFromCourseFailed(message: data['message']));
      }
    } catch (e) {
      emit(DeleteSectionFromCourseFailed(message: e.toString()));
    }
  }

  Future<dynamic> addVideoToSection(String id, String selectionIndex) async {
    try {
      emit(AddVideoToSectionLoading());
      Response response = await http.post(
          Uri.parse('$apiUser/courses/$id/sections/$selectionIndex/videos'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(AddVideoToSectionLoaded());
      } else {
        emit(AddVideoToSectionFailed(message: data['message']));
      }
    } catch (e) {
      emit(AddVideoToSectionFailed(message: e.toString()));
    }
  }

  Future<dynamic> updateVideoInfo(
      String id, String selectionIndex, String videoIndex,
      {required String videoTitle, required bool isPreview}) async {
    try {
      emit(UpdateCourseLoading());
      Response response = await http.patch(Uri.parse(
          '$apiUser/courses/$id/sections/$selectionIndex/videos/$videoIndex'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(UpdateVideoInfoLoaded());
      } else {
        emit(UpdateVideoInfoFailed(message: data['message']));
      }
    } catch (e) {
      emit(UpdateVideoInfoFailed(message: e.toString()));
    }
  }

  Future<dynamic> deleteVideo(
    String id,
    String selectionIndex,
    String videoIndex,
  ) async {
    try {
      emit(DeleteVideoLoading());
      Response response = await http.delete(Uri.parse(
          '$apiUser/courses/$id/sections/$selectionIndex/videos/$videoIndex'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(DeleteVideoLoaded());
      } else {
        emit(DeleteVideoFailed(message: data['message']));
      }
    } catch (e) {
      emit(DeleteVideoFailed(message: e.toString()));
    }
  }
}
