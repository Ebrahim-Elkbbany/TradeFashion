import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/core/widgets/custom_continue_with_container.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';
import 'package:trade_fashion/features/auth/presentation/views/widgets/login_view_row.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsetsDirectional.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Text('Sign in', style: Styles.textStyle32),
              const SizedBox(
                height: 32,
              ),
              const CustomTextFormField(
                hintText: 'Email Address',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFormField(
                hintText: 'Password',
              ),
              const  SizedBox(
                height: 16,
              ),
               LoginViewRow(
                buttonName: 'Reset',
                leftName: 'Forget Password? ',
                 onPressed: (){
                  GoRouter.of(context).push(AppRouter.kResetPassView);
                 },
              ),
              const  SizedBox(
                height: 25,
              ),
              CustomButton(
                buttonName: 'LOGIN',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kLayoutView);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              LoginViewRow(
                buttonName:'SignUp' ,
                leftName: 'Don\'t Have An Account? ',
                onPressed: (){
                  GoRouter.of(context).push(AppRouter.kRegisterView);
                },
              ),
              const SizedBox(
                height: 72,
              ),
               ContinueWithContainer(
                image: 'assets/images/auth/apple_svg.png',
                name: 'Continue With Apple',
                 onTap: () {

                 },
              ),
              const SizedBox(
                height: 16,
              ),
              ContinueWithContainer(
                image:'assets/images/auth/google.png',
                name: 'Continue With Google',
                 onTap: () {

                 },
              ),
              const SizedBox(
                height: 16,
              ),
              ContinueWithContainer(
                image:'assets/images/auth/Facebook.png',
                name: 'Continue With Facebook',
                 onTap: () {

                 },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
