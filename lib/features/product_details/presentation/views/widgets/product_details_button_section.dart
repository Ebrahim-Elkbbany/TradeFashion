import 'package:flutter/material.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_details_button.dart';

import '../../../../home/data/models/product_model.dart';

class AddCardButtonSection extends StatelessWidget {
  const AddCardButtonSection({Key? key, this.productModelProduct}) : super(key: key);
  final ProductModelProduct? productModelProduct;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        children: [
          Text(
            '${productModelProduct!.price!.current!.value!}',
            style:const  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          const AddCardButton(),
        ],
      ),
    );
  }
}