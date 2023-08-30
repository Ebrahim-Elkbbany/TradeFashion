import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:trade_fashion/features/splash/presentation/views/widgets/animated_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initAnimationSplashView();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: AnimatedText(slidingAnimation: slidingAnimation));
  }
  void initAnimationSplashView() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
          () {
        GoRouter.of(context).push(AppRouter.kLoginView);
      },
    );
  }
}
