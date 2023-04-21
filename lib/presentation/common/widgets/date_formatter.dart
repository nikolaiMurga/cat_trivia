import 'package:cat_trivia/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatter extends StatelessWidget {
  final String date;

  const DateFormatter({required this.date, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMMMMd(Localizations.localeOf(context).languageCode).format(DateTime.tryParse(date) ?? DateTime.now()),
      style: AppStyles.dateTextStyle,
    );
  }
}
