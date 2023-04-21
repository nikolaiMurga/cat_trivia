import 'package:cat_trivia/app/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@injectableInit
Future<void> setupLocator() async => locator.init();