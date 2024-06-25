import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'comment_detection_state.dart';

class CommentDetectionCubit extends Cubit<CommentDetectionState> {
  CommentDetectionCubit() : super(CommentDetectionInitial());
  Future<void> sendComment(String comment) async {
    emit(CommentLoading());
    try {
      final result = await _sendCommentToModel(comment);
      emit(CommentSuccess(comment: comment));
    } catch (e) {
      emit(CommentFailure(error: e.toString()));
    }
  }

  Future<Map<String, dynamic>> _sendCommentToModel(String comment) async {
    final url = "$baseUrl/predict";
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"comment": comment}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to detect comment');
    }
  }
}
