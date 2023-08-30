import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';

class RegisterViewTextFieldSection extends StatelessWidget {
  const RegisterViewTextFieldSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
          hintText: 'FirstName',
        ),
        SizedBox(
          height: 16.h,
        ),
        const CustomTextFormField(
          hintText: 'LastName',
        ),
        SizedBox(
          height: 16.h,
        ),
        const CustomTextFormField(
          hintText: 'Email Address',
        ),
        SizedBox(
          height: 16.h,
        ),
        const CustomTextFormField(
          hintText: 'Password',
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    );
  }
}
