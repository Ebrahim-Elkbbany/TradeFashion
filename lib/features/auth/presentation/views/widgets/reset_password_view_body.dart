import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 20.h),
        Text('Reset Password', style: Styles.textStyle32),
        SizedBox(
          height: 32.h,
        ),
        const CustomTextFormField(
          hintText: 'Enter Email Address',
        ),
        SizedBox(
          height: 24.h,
        ),
        CustomButton(
          buttonName: 'Send Code',
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kEmailVerifyCodeView);
          },
        ),
      ]),
    );
  }
}
