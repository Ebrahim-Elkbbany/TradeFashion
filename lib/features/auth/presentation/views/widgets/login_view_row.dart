import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_text_button.dart';

class LoginViewRow extends StatelessWidget {
  const LoginViewRow({Key? key, this.onPressed, required this.buttonName, required this.leftName}) : super(key: key);
  final void Function()? onPressed;
  final String buttonName;
  final String leftName;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(leftName, style: Styles.textStyle12),
        CustomTextButton(
          onPressed: onPressed,
          text: buttonName,
          textStyle: Styles.textStyle12.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
