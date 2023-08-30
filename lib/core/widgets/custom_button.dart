import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.buttonName, this.onPressed})
      : super(key: key);

  final String buttonName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.w,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(
                  100,
                ).w,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: Styles.textStyle16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
