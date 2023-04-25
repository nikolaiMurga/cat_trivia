import 'package:cat_trivia/app/locator.dart';
import 'package:cat_trivia/presentation/common/helpers/navigation.dart';
import 'package:cat_trivia/presentation/common/widgets/date_formatter.dart';
import 'package:cat_trivia/presentation/history/history_page.dart';
import 'package:cat_trivia/presentation/random/bloc/random_cubit.dart';
import 'package:cat_trivia/presentation/random/widgets/button.dart';
import 'package:cat_trivia/presentation/random/widgets/cat_image.dart';
import 'package:cat_trivia/resources/app_strings.dart';
import 'package:cat_trivia/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Content extends StatelessWidget {
  final _navigation = locator<Navigation>();
  final String text;
  final String date;
  final String imageUrl;

  Content({required this.text, required this.imageUrl, required this.date, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(

              child: Column(
                children: [
                  CatImage(imageUrl: imageUrl),
                  const SizedBox(height: 20),
                  DateFormatter(date: date),
                  const SizedBox(height: 20),
                  Text(text, style: AppStyles.mainTextStyle),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(onPressed: () => context.read<RandomCubit>().setup(), text: AppStrings.antherFact),
              const SizedBox(width: 20),
              Button(onPressed: () => _navigation.push(context, const HistoryPage()), text: AppStrings.history),
            ],
          ),
        ],
      ),
    );
  }
}
