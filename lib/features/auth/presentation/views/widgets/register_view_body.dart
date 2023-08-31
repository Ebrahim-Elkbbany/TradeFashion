import 'package:flutter/cupertino.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/features/auth/presentation/views/widgets/register_view_text_field_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const   SizedBox(height: 20),
          Text('Register', style: Styles.textStyle32),
          const  SizedBox(
            height: 32,
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
