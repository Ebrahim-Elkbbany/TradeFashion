import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/styles.dart';

class CustomCheckOutPriceRow extends StatelessWidget {
  const CustomCheckOutPriceRow({Key? key, required this.text, required this.price}) : super(key: key);
  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          text,
          style: Styles.textStyle16.copyWith(
            color: Colors.black54,
          ),
        ),
        const Spacer(),
        Text(
            price,
            style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w600
            )
        ),

      ],
    );
  }
}
