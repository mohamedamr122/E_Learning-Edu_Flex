part of 'comment_detection_cubit.dart';

@immutable
sealed class CommentDetectionState {}

final class CommentDetectionInitial extends CommentDetectionState {}

final class CommentLoading extends CommentDetectionState {}

final class CommentSuccess extends CommentDetectionState {
  final String comment;

  CommentSuccess({required this.comment});
}

final class CommentFailure extends CommentDetectionState {
  final String error;

  CommentFailure({required this.error});
}
