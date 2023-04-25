import 'package:cat_trivia/presentation/splash/splash_page.dart';
import 'package:cat_trivia/resources/app_strings.dart';
import 'package:flutter/material.dart';

class CatTrivia extends StatelessWidget {
  const CatTrivia({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: AppStrings.catTrivia, home: SplashPage());
  }
}
