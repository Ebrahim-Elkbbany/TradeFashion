import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_text_button.dart';
import 'package:trade_fashion/features/auth/presentation/manger/auth_cubit.dart';

class ProfileInfoContainer extends StatelessWidget {
  const ProfileInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 96,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
               var cubit=AuthCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cubit.authModel['firstName']+" "+cubit.authModel['lastName'],
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      cubit.authModel['email'],
                      style: Styles.textStyle16.copyWith(
                        color: Colors.black45,
                      ),
                    ),
                  ],
                );
              },
            ),
            CustomTextButton(
              text: 'Edit',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kEditProfileViewPath);
              },
              textStyle: Styles.textStyle12
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
