import 'package:flutter/material.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';

class RegisterViewTextFieldSection extends StatelessWidget {
  const RegisterViewTextFieldSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         CustomTextFormField(
          hintText: 'FirstName',
        ),
        SizedBox(
          height: 16,
        ),
         CustomTextFormField(
          hintText: 'LastName',
        ),
        SizedBox(
          height: 16,
        ),
         CustomTextFormField(
          hintText: 'Email Address',
        ),
         SizedBox(
          height: 16,
        ),
         CustomTextFormField(
          hintText: 'Password',
        ),
         SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
