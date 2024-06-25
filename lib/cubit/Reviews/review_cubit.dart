import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:new_eduflex/constants/constants.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());
  Future<dynamic> getAllReviews() async {
    try {
      emit(GetAllReviewsLoading());
      Response response = await http.get(Uri.parse('$apiUser/reviews'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(GetAllReviewsLoaded());
      } else {
        emit(GetAllReviewsFailed(message: data['message']));
      }
    } catch (e) {
      emit(GetAllReviewsFailed(message: e.toString()));
    }
  }

  Future<dynamic> createReviews(
      {required int rating,
      required String comment,
      required String course}) async {
    try {
      Response response = await http.post(Uri.parse('$apiUser/reviews'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(CreateReviewsLoaded());
      } else {
        emit(CreateReviewsFailed(message: data['message']));
      }
    } catch (e) {
      emit(CreateReviewsFailed(message: e.toString()));
    }
  }

  Future<dynamic> getSingleReview(String reviewID) async {
    try {
      emit(GetSingleReviewLoading());
      Response response =
          await http.get(Uri.parse('$apiUser/reviews/$reviewID'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(GetSingleReviewLoaded());
      } else {
        emit(GetSingleReviewFailed(message: data['message']));
      }
    } catch (e) {
      emit(GetSingleReviewFailed(message: e.toString()));
    }
  }

  Future<dynamic> updateReview(String id,
      {required int rating,
      required String title,
      required String comment}) async {
    try {
      emit(UpdateReviewLoading());
      Response response = await http.patch(Uri.parse('$apiUser/reviews/$id'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(UpdateReviewLoaded());
      } else {
        emit(UpdateReviewFailed(message: data['message']));
      }
    } catch (e) {
      emit(UpdateReviewFailed(message: e.toString()));
    }
  }

  Future<dynamic> deleteReview(String id) async {
    try {
      emit(DeleteReviewLoading());
      Response response = await http.delete(Uri.parse('$apiUser/reviews/$id'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(DeleteReviewLoaded());
      } else {
        emit(DeleteReviewFailed(message: data['message']));
      }
    } catch (e) {
      emit(DeleteReviewFailed(message: e.toString()));
    }
  }
}
