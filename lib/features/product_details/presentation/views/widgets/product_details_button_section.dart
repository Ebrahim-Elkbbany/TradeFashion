import 'package:flutter/material.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_details_button.dart';

import '../../../../cart/presentation/manger/cart_cubit.dart';
import '../../../../home/data/models/product_model.dart';

class AddCardButtonSection extends StatelessWidget {
  const AddCardButtonSection(
      {Key? key,
      required this.name,
      required this.productId,
      required this.price,
      required this.mainImage})
      : super(key: key);
  final String name;
  final String productId;
  final String price;
  final String mainImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        children: [
          Text(
            price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          AddCardButton(onTap: () {
            CartCubit.get(context).insertToCart(
              totalPrice: double.parse(price),
                productName: name,
                productId: productId,
                price: double.parse(price),
                quantity: 1,
                image: mainImage,
                color: 'Black',
                size: 'M');
          }),
        ],
      ),
    );
  }
}
