import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/styles.dart';

import 'widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        title:  const Text('Cart'),
      ),
      body: const CartViewBody(),
    );
  }
}
