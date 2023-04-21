import 'package:cat_trivia/app/locator.dart';
import 'package:cat_trivia/presentation/splash/bloc/splash_cubit.dart';
import 'package:cat_trivia/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<SplashCubit>()..setup(),
      child: SplashScreen(),
    );
  }
}
