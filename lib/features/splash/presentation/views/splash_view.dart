import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SplashViewBody(),
    );
  }
}
