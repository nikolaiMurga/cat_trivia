part of 'splash_cubit.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashSucceed extends SplashState {}

class SplashFailed extends SplashState {
  final String error;

  SplashFailed({required this.error});
}
