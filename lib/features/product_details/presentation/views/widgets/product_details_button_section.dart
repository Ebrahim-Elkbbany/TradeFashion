import 'package:flutter/material.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_details_button.dart';

import '../../../../cart/presentation/manger/cart_cubit.dart';
import '../../../../home/data/models/product_model.dart';

class AddCardButtonSection extends StatelessWidget {
  const AddCardButtonSection({Key? key, this.productModelProduct})
      : super(key: key);
  final ProductModelProduct? productModelProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        children: [
          Text(
            '${productModelProduct!.price!.current!.value!}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          AddCardButton(onTap: () {
            CartCubit.get(context).insertbCart(
                productName: productModelProduct!.name!,
                productId: "${productModelProduct!.id}",
                price: productModelProduct!.price!.current!.text!,
                quantity: 1,
                image: 'http://${productModelProduct!.imageUrl}',
                color: productModelProduct!.colour!,
                size: 'M');
          }),
        ],
      ),
    );
  }
}
