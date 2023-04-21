import 'package:cat_trivia/resources/app_colors.dart';
import 'package:cat_trivia/resources/app_styles.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String text;

  const Button({required this.onPressed, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        color: AppColors.grey,
        height: 50,
        onPressed: () => onPressed(),
        child: Text(text, style: AppStyles.buttonTextStyle),
      ),
    );
  }
}
