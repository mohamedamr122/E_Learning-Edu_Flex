part of 'review_cubit.dart';
@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

final class GetAllReviewsLoading extends ReviewState {}

final class GetAllReviewsLoaded extends ReviewState {}

final class GetAllReviewsFailed extends ReviewState {
  final String message;

  GetAllReviewsFailed({required this.message});
}
final class CreateReviewsLoading extends ReviewState {}

final class CreateReviewsLoaded extends ReviewState {}

final class CreateReviewsFailed extends ReviewState {
  final String message;

  CreateReviewsFailed({required this.message});
}
final class GetSingleReviewLoading extends ReviewState {}

final class GetSingleReviewLoaded extends ReviewState {}

final class GetSingleReviewFailed extends ReviewState {
  final String message;

  GetSingleReviewFailed({required this.message});
}
final class UpdateReviewLoading extends ReviewState {}

final class UpdateReviewLoaded extends ReviewState {}

final class UpdateReviewFailed extends ReviewState {
  final String message;

  UpdateReviewFailed({required this.message});
}
final class DeleteReviewLoading extends ReviewState {}

final class DeleteReviewLoaded extends ReviewState {}

final class DeleteReviewFailed extends ReviewState {
  final String message;

  DeleteReviewFailed({required this.message});
}