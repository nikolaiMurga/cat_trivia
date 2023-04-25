import 'package:cat_trivia/domain/models/cats_fact_model.dart';
import 'package:cat_trivia/presentation/common/widgets/date_formatter.dart';
import 'package:cat_trivia/resources/app_colors.dart';
import 'package:cat_trivia/resources/app_styles.dart';
import 'package:flutter/material.dart';

class FactsList extends StatelessWidget {
  final List<CatsFactModel> list;

  const FactsList({required this.list, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(color: AppColors.grey),
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateFormatter(date: list[index].createdAt),
            const SizedBox(height: 5),
            Text(list[index].text, style: AppStyles.tactTextStyle),
          ],
        ),
        itemCount: list.length,
      ),
    );
  }
}
