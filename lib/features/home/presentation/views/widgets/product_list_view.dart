import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';
import 'list_view_product_item.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
    this.productModel,
  });

  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: MediaQuery.of(context).size.width.toInt() < 560 ? 2 : 6,
      mainAxisSpacing: 10,
      childAspectRatio:
          MediaQuery.of(context).size.width.toInt() < 560 ? 1 / 1.8 : 1 / 1.2,
      crossAxisSpacing: 10,
      children: List.generate(
        productModel!.products!.length,
        (index) {
          return Center(
            child: ListViewProductItem(
              productModelProduct: productModel!.products![index],
            ),
          );
        },
      ),
    );
  }
}
