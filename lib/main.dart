import 'package:cat_trivia/app/locator.dart';
import 'package:cat_trivia/cat_trivia.dart';
import 'package:cat_trivia/data/db/persistence_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  await PersistenceHelper.initHive();
  await setupLocator();
  runApp(const CatTrivia());
}
