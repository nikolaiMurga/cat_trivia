import 'package:cat_trivia/app/locator.dart';
import 'package:cat_trivia/presentation/common/helpers/navigation.dart';
import 'package:cat_trivia/presentation/common/widgets/bg_screen_wrapper.dart';
import 'package:cat_trivia/presentation/random/random_page.dart';
import 'package:cat_trivia/presentation/splash/bloc/splash_cubit.dart';
import 'package:cat_trivia/resources/app_images.dart';
import 'package:cat_trivia/resources/app_strings.dart';
import 'package:cat_trivia/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  final _navigation = locator<Navigation>();

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BgScreenWrapper(
      background: AppImages.splashBg,
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashSucceed) _navigation.clearPush(context, const RandomPage());

        },
        child: Center(
          child: Text(AppStrings.catTrivia.toUpperCase(), style: AppStyles.mainTextStyle),
        ),
      ),
    );
  }
}

