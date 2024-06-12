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
