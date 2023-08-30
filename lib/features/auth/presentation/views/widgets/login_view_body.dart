import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsetsDirectional.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70.h),
              Text('Sign in', style: Styles.textStyle32),
              SizedBox(
                height: 32.h,
              ),
              const CustomTextFormField(
                hintText: 'Email Address',
              ),
              SizedBox(
                height: 20.h,
              ),
              const CustomTextFormField(
                hintText: 'Password',
              ),
              SizedBox(
                height: 16.h,
              ),
               LoginViewRow(
                buttonName: 'Reset',
                leftName: 'Forget Password? ',
                 onPressed: (){},
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                buttonName: 'LOGIN',
                onPressed: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              LoginViewRow(
                buttonName:'SignUp' ,
                leftName: 'Don\'t Have An Account? ',
                onPressed: (){},
              ),
              SizedBox(
                height: 72.h,
              ),
               ContinueWithContainer(
                image: 'assets/images/auth/apple_svg.png',
                name: 'Continue With Apple',
                 onTap: () {

                 },
              ),
              SizedBox(
                height: 16.h,
              ),
              ContinueWithContainer(
                image:'assets/images/auth/google.png',
                name: 'Continue With Google',
                 onTap: () {

                 },
              ),
              SizedBox(
                height: 16.h,
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
