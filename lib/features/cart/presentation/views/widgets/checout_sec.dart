import 'package:flutter/material.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/features/cart/presentation/views/widgets/custom_check_out_price_row.dart';

class CheOutSec extends StatelessWidget {
  const CheOutSec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const CustomCheckOutPriceRow(text: 'Subtotal', price: '\$200'),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const CustomCheckOutPriceRow(text: 'Tax', price: '\$0.00'),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const CustomCheckOutPriceRow(text: 'Subtotal', price: '\$200'),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        const CustomButton(
          buttonName: 'Checkout',
        ),
      ],
    );
  }
}