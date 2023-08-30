
import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/assets.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child:  Image.asset(AssetsData.logoImage),
        );
      },
    );
  }
}
