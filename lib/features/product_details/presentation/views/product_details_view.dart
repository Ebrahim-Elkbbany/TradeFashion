import 'package:flutter/material.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_details_view_body.dart';

import '../../../home/data/models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key, this.productModelProduct}) : super(key: key);
  final ProductModelProduct? productModelProduct;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ProductDetailsViewBody(productModelProduct:productModelProduct),
      ),
    );
  }
}
