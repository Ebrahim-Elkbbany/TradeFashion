import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: kPrimaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      backgroundColor: kPrimaryColor,
      body: const SplashViewBody(),
    );
  }
}
