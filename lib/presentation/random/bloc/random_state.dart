part of 'random_cubit.dart';

abstract class RandomState {}

class RandomInitial extends RandomState {}

class RandomLoading extends RandomState {}

class RandomSucceed extends RandomState {
  final String text;
  final String createdAt;
  final String imageUrl;

  RandomSucceed({required this.text, required this.createdAt, required this.imageUrl});
}

class RandomFailed extends RandomState {
  final String error;

  RandomFailed({required this.error});
}
