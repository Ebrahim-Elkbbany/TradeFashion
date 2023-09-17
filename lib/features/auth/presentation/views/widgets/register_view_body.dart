import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:trade_fashion/core/utils/assets.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/features/auth/presentation/views/widgets/register_view_text_field_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 23),
      child: SingleChildScrollView(
        padding: EdgeInsetsDirectional.zero,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AssetsData.registerImage,height: 200,width: double.infinity,
            ),
            Text('Register', style: Styles.textStyle32),
            const  SizedBox(
              height: 32,
            ),
            const RegisterViewTextFieldSection(),
            CustomButton(
              buttonName: 'Register',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kLayoutView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
