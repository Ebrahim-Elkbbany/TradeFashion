import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('Verify Code', style: Styles.textStyle32),
            const SizedBox(
              height: 32,
            ),
            const CustomTextFormField(
              hintText: 'Enter Code',
            ),
            CustomButton(
              buttonName: 'Send Code',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kEmailVerifyCodeView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
