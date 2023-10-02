import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';
import 'package:trade_fashion/features/auth/presentation/manger/auth_cubit.dart';

import '../../../../../core/widgets/custom_button.dart';

class EditProfileViewTextFieldSec extends StatelessWidget {
  const EditProfileViewTextFieldSec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fNameController = TextEditingController();
    var sNameController = TextEditingController();
    var passController = TextEditingController();
    var emailController = TextEditingController();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (BuildContext context, state) {
        var cubit = AuthCubit.get(context);

        fNameController.text = cubit.authModel['firstName'];
        sNameController.text = cubit.authModel['lastName'];
        passController.text = cubit.authModel['password'];
        emailController.text = cubit.authModel['email'];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'First Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              controller: fNameController,
              type: TextInputType.name,
              suffix: Icons.person,
            ),
            const SizedBox(height: 18),
            const Text(
              'Last Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              controller: sNameController,
              type: TextInputType.name,
              suffix: Icons.person,
            ),
            const SizedBox(height: 18),
            const Text(
              'Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              controller: emailController,
              type: TextInputType.emailAddress,
              suffix: Icons.email,
            ),
            const SizedBox(height: 18),
            const Text(
              'Password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              isPassword: true,
              controller: passController,
              type: TextInputType.visiblePassword,
              suffix: Icons.lock,
            ),
            const SizedBox(height: 70),
            CustomButton(
              buttonName: 'Save Changes',
              radius: 8,
              onPressed: () {
                cubit.updateUserData(firstName: fNameController.text,
                    lastName:  sNameController.text,
                    email: emailController.text,
                    password: passController.text);
              },
            ),
          ],
        );
      },
    );
  }
}
