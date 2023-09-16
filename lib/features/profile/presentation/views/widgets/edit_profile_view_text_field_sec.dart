import 'package:flutter/material.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';

class EditProfileViewTextFieldSec extends StatelessWidget {
  const EditProfileViewTextFieldSec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        CustomTextFormField(
          type: TextInputType.name,
          hintText: 'Khaled',
          suffix: Icons.person,
        ),
        SizedBox(height: 18),
        Text(
          'Phone',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        CustomTextFormField(
          type: TextInputType.emailAddress,
          hintText: 'test@gmail.com',
          suffix: Icons.email,
        ),
        SizedBox(height: 18),
        Text(
          'Password',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        CustomTextFormField(
          type: TextInputType.visiblePassword,
          hintText: '* * * * * * * * *',
          suffix: Icons.visibility_outlined,
        ),
      ],
    );
  }
}
