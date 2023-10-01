import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:trade_fashion/core/utils/assets.dart';
import 'package:trade_fashion/core/utils/shared_prefrence.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/core/widgets/custom_continue_with_container.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';
import 'package:trade_fashion/features/auth/presentation/manger/auth_cubit.dart';
import 'package:trade_fashion/features/auth/presentation/views/widgets/login_view_row.dart';
import 'package:trade_fashion/features/category/presentation/manger/category_product_cubit/category_product_cubit.dart';
import 'package:trade_fashion/features/favourites/presentation/manger/favourites_cubit/favourites_cubit.dart';
import 'package:trade_fashion/features/home/presentation/manger/home_cubit.dart';
import 'package:trade_fashion/features/layout/layout.dart';
import '../../../../../core/utils/component.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            CategoryProductCubit().getCategoryProduct(categoryId: 4208);
            FavouritesCubit().getFavourite();
            HomeCubit().getHomeProduct();
            SharedPreference.setData(key: 'tokenEmail', value: tokenEmail).then((value) {
              navigateTo(context, const LayoutView());
            });
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsetsDirectional.zero,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AssetsData.loginImage,
                        fit: BoxFit.fill,

                      ),
                    ),
                    Text('Login', style: Styles.textStyle32),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ('field must noy empty');
                        }
                      },
                      hintText: 'Email Address',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      controller: passController,
                      type: TextInputType.visiblePassword,

                      validate: (value) {
                        if (value!.isEmpty ) {

                        return ('field must noy empty');
                        }
                      },
                      hintText: 'Password',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    LoginViewRow(
                      buttonName: 'Reset',
                      leftName: 'Forget Password? ',
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kResetPassView);
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                      buttonName: 'LOGIN',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.login(
                              email: emailController.text,
                              password: passController.text);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginViewRow(
                      buttonName: 'SignUp',
                      leftName: 'Don\'t Have An Account? ',
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kRegisterView);
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ContinueWithContainer(
                      image: 'assets/images/auth/apple_svg.png',
                      name: 'Continue With Apple',
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ContinueWithContainer(
                      image: 'assets/images/auth/google.png',
                      name: 'Continue With Google',
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ContinueWithContainer(
                      image: 'assets/images/auth/Facebook.png',
                      name: 'Continue With Facebook',
                      onTap: () async {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
