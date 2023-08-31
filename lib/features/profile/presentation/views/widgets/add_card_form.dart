import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';

class AddCardForm extends StatelessWidget {
  const AddCardForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Add Card',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const CustomTextFormField(
            hintText: 'Card Number',
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTextFormField(
            hintText: 'CCV',
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTextFormField(
            hintText: 'Exp',
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTextFormField(
            hintText: 'Cardholder Name',
          ),
          const SizedBox(
            height: 32,
          ),
          const CustomButton(buttonName: 'Save'),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
