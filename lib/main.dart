import 'package:cat_trivia/app/locator.dart';
import 'package:cat_trivia/data/db/persistance_hepler.dart';
import 'package:cat_trivia/presentation/splash/splash_page.dart';
import 'package:cat_trivia/resources/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  await PersistenceHelper.initHive();
  await setupLocator();
  runApp(const CatTrivia());
}

class CatTrivia extends StatelessWidget {
  const CatTrivia({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.catTrivia,
      home: SplashPage(),
    );
  }
}

