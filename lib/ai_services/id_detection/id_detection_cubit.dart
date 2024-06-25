import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:new_eduflex/constants/constants.dart';

part 'id_detection_state.dart';

class IdDetectionCubit extends Cubit<IdDetectionState> {
  IdDetectionCubit() : super(IdDetectionInitial());
  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio();
  void pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      emit(ImagePicked(File(pickedFile.path)));
    } else {
      emit(ImageUploadFailed("No image selected"));
    }
  }
  void uploadImage(File imageFile) async {
    emit(ImageUploading());
    try {
      final response = await _uploadImage(imageFile);
      if (response.statusCode == 200) {
        final result = response.data;
        emit(ImageUploaded(result));
      } else {
        emit(ImageUploadFailed("Failed to upload image"));
      }
    } catch (e) {
      emit(ImageUploadFailed(e.toString()));
    }
  }

  Future<Response> _uploadImage(File imageFile) async {
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imageFile.path, filename: 'upload.jpg'),
    });

    return await _dio.post('$baseUrl/detect_image', data: formData);
  }
}