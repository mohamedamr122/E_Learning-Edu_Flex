part of 'id_detection_cubit.dart';

@immutable
sealed class IdDetectionState {}

class IdDetectionInitial extends IdDetectionState {}

class ImagePicked extends IdDetectionState {
  final File imageFile;

  ImagePicked(this.imageFile);
}

class ImageUploading extends IdDetectionState {}

class ImageUploaded extends IdDetectionState {
  final String result;

  ImageUploaded(this.result);
}

class ImageUploadFailed extends IdDetectionState {
  final String error;

  ImageUploadFailed(this.error);
}