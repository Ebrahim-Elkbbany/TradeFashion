import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/features/auth/presentation/views/widgets/register_view_text_field_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text('Register', style: Styles.textStyle32),
          SizedBox(
            height: 32.h,
          ),
          const RegisterViewTextFieldSection(),
          CustomButton(
            buttonName: 'Register',
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }
}
