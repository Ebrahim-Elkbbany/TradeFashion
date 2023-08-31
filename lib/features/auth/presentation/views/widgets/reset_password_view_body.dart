import 'package:flutter/material.dart';
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
      padding:const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
        Text('Reset Password', style: Styles.textStyle32),
        const SizedBox(
          height: 32,
        ),
        const CustomTextFormField(
          hintText: 'Enter Email Address',
        ),
        const  SizedBox(
          height: 24,
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
