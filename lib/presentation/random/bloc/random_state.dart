part of 'random_cubit.dart';

abstract class RandomState extends Equatable{}

class RandomInitial extends RandomState {
  @override
  List<Object?> get props => [];
}

class RandomLoading extends RandomState {
  @override
  List<Object?> get props => [];
}

class RandomSucceed extends RandomState {
  final String text;
  final String createdAt;
  final String imageUrl;

  RandomSucceed({required this.text, required this.createdAt, required this.imageUrl});

  @override
  List<Object?> get props => [text, createdAt, imageUrl];
}

class RandomFailed extends RandomState {
  final String error;

  RandomFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
