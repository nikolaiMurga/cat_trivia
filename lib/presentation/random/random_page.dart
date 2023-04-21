import 'package:cat_trivia/app/locator.dart';
import 'package:cat_trivia/presentation/random/bloc/random_cubit.dart';
import 'package:cat_trivia/presentation/random/random_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomPage extends StatelessWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<RandomCubit>()..setup(),
      child: const RandomScreen(),
    );
  }
}
