import 'package:flutter/material.dart';

import 'widgets/product_details_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ProductDetailsViewBody(),
    );
  }
}
