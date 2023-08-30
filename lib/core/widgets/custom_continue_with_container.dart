import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_fashion/core/utils/styles.dart';

class ContinueWithContainer extends StatelessWidget {
  const ContinueWithContainer({Key? key, required this.image, required this.name, this.onTap}) : super(key: key);
  final String image;
  final String name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(100).w,

        ),
        height: 50.h,
        width: double.infinity,
        child: Row(

          children: [
            SizedBox(
              width: 22.w,
            ),
            Image.asset(image,height: 25.h,width: 25.w),
             SizedBox(
              width: 54.w,
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
