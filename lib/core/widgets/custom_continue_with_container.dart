import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/styles.dart';

class ContinueWithContainer extends StatelessWidget {
  const ContinueWithContainer({Key? key, required this.image, required this.name, this.onTap, this.height =50}) : super(key: key);
  final String image;
  final String name;
  final double height;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(100),

        ),
        height: height,
        width: double.infinity,
        child: Row(

          children: [
            const SizedBox(
              width: 22,
            ),
            Image.asset(image,height: 25,width: 25),
            const SizedBox(
              width: 54,
            ),
            Text(
              name,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
