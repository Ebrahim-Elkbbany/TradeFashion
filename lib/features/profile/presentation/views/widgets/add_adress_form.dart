import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';

class AddAddressForm extends StatelessWidget {
  const AddAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Add Address',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const CustomTextFormField(
            hintText: 'Street Address',
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTextFormField(
            hintText: 'City',
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTextFormField(
            hintText: 'Governorate',
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
