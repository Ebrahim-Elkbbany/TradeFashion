import 'package:flutter/material.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_details_button.dart';

class AddCardButtonSection extends StatelessWidget {
  const AddCardButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        children: [
          Text(
            '\$349.99',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Spacer(),
          AddCardButton(),
        ],
      ),
    );
  }
}