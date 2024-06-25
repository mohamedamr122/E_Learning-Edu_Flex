import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class VideoUploadService {
  static Future uploadVideo(String filePath, String apiUrl) async {
    final dio = Dio();

    // Optional Progress Callback for Uploading
    progressCallback(int sent, int total) {
      final progress = ((sent / total) * 100).toStringAsFixed(2);
      print('Upload Progress: $progress%');
    }

    final formData = FormData.fromMap({
      'video': await MultipartFile.fromFile(File(filePath) as String, filename: 'video.mp4'),
    });

    try {
      final response = await dio.post(
        apiUrl,
        data: formData,
        onSendProgress: progressCallback, // Optional: Add progress callback
      );
      return response;
    } on DioError catch (error) {
      // Handle DioError (e.g., network error, server error)
      print('Error uploading video: ${error.message}');
      rethrow; // Re-throw for further handling
    }
  }
}