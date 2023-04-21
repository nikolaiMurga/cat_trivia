import 'package:cat_trivia/app/locator.dart';
import 'package:cat_trivia/presentation/history/bloc/history_cubit.dart';
import 'package:cat_trivia/presentation/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<HistoryCubit>()..setupHistoryPage(),
      child: const HistoryScreen(),
    );
  }
}
