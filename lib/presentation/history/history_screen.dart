import 'package:cat_trivia/presentation/common/helpers/toast_mixin.dart';
import 'package:cat_trivia/presentation/common/widgets/loading_indicator.dart';
import 'package:cat_trivia/presentation/history/bloc/history_cubit.dart';
import 'package:cat_trivia/presentation/history/widgets/facts_list.dart';
import 'package:cat_trivia/resources/app_colors.dart';
import 'package:cat_trivia/resources/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget with ToastMixin {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        title: const Text(AppStrings.history),
        centerTitle: true,
      ),
      body: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) {
          if (state is HistoryFailed) showToast(state.error);
        },
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const LoadingIndicator();
          }
          if (state is HistorySucceed) {
            return FactsList(list: state.list);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
