import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';
import 'package:trade_fashion/features/auth/presentation/manger/auth_cubit.dart';
import 'package:trade_fashion/features/home/presentation/manger/home_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/component.dart';
import '../../../../../core/utils/shared_prefrence.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../category/presentation/manger/category_product_cubit/category_product_cubit.dart';
import '../../../../favourites/presentation/manger/favourites_cubit/favourites_cubit.dart';
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
            SharedPreference.setData(key: 'tokenEmail', value: tokenEmail).then((value) {
              token = SharedPreference.getData(key: 'tokenEmail');
              CategoryProductCubit().getCategoryProduct(categoryId: 4208);
              FavouritesCubit().getFavourite();
              HomeCubit().getHomeProduct();
              navigateTo(context, const LayoutView());
            });
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
                  if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value!) == false){
                     return ('Check your email');
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
