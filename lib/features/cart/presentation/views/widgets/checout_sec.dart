import 'package:flutter/material.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/features/cart/presentation/views/widgets/custom_check_out_price_row.dart';

import '../../manger/cart_cubit.dart';

class CheOutSec extends StatelessWidget {
  const CheOutSec({Key? key, required this.cubit}) : super(key: key);
  final CartCubit cubit;

  @override
  Widget build(BuildContext context) {
    int total=double.parse(cubit.getTotal().toString()).round();
    return  Column(
      children: [
         CustomCheckOutPriceRow(text: 'Subtotal', price: '\$ $total'),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
         CustomCheckOutPriceRow(text: 'Tax', price: '\$ ${(total*.05).round()}'),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
         CustomCheckOutPriceRow(text: 'Subtotal', price: '\$  ${(total*.05).round() +total}'),
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