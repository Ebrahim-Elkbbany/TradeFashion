
import 'package:flutter/material.dart';

import 'package:trade_fashion/core/utils/styles.dart';

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
          child:   Text("Trade \nFashion",style: Styles.textStyle32.copyWith(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 42),textAlign: TextAlign.center),
        );
      },
    );
  }
}
