import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';
import 'package:trade_fashion/features/auth/presentation/manger/auth_cubit.dart';

import '../../../../../core/utils/component.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../layout/layout.dart';

class RegisterViewTextFieldSection extends StatelessWidget {
  const RegisterViewTextFieldSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fNameController = TextEditingController();
    var lNameController = TextEditingController();
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            navigateTo(context, const LayoutView());
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Column(
            children: [
              CustomTextFormField(
                controller: fNameController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return ('field must noy empty');
                  }
                  return null;
                },
                hintText: 'FirstName',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: lNameController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return ('field must noy empty');
                  }
                  return null;
                },
                hintText: 'LastName',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: emailController,
                type: TextInputType.emailAddress,
                validate: (value) {
                  if (value!.isEmpty) {
                    return ('field must noy empty');
                  }
                  return null;
                },
                hintText: 'Email Address',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: passController,
                type: TextInputType.visiblePassword,
                validate: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return ('field must noy empty');
                  }
                  return null;
                },
                hintText: 'Password',
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                buttonName: 'Register',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    cubit.register(
                        firstName: fNameController.text,
                        lastName: lNameController.text,
                        email: emailController.text,
                        password: passController.text);
                  }

                  // GoRouter.of(context).push(AppRouter.kLayoutView);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
