import 'package:cat_trivia/presentation/common/helpers/toast_mixin.dart';
import 'package:cat_trivia/presentation/common/widgets/loading_indicator.dart';
import 'package:cat_trivia/presentation/random/bloc/random_cubit.dart';
import 'package:cat_trivia/presentation/random/widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomScreen extends StatelessWidget with ToastMixin {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: BlocConsumer<RandomCubit, RandomState>(
          listener: (context, state) {
            if (state is RandomFailed) showToast(state.error);
          },
          builder: (context, state) {
            if (state is RandomLoading) {
              return const LoadingIndicator();
            }
            if (state is RandomSucceed) {
              return Content(text: state.text, date: state.createdAt, imageUrl: state.imageUrl);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
