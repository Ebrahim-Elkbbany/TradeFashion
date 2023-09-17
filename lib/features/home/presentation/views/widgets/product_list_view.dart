import 'package:flutter/material.dart';
import 'package:trade_fashion/features/home/DD.dart';

import 'list_view_product_item.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key, this.categoryModel,
  });
  final CategoryModel ?categoryModel;
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width.toInt()<560) {
      return GridView.count(
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        crossAxisCount:2,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / 1.7,
        crossAxisSpacing: 10,
        children: List.generate(
          10,
              (index) {
            return  Center(child:  ListViewProductItem());
          },
        ),
      );
    }
    return GridView.count(
      shrinkWrap: true,
      physics:const NeverScrollableScrollPhysics(),
      crossAxisCount:6,
      mainAxisSpacing: 10,
      childAspectRatio: 1 / 1.2,
      crossAxisSpacing: 5,
      children: List.generate(
        10,
            (index) {
          return const Center(child:  ListViewProductItem());
        },
      ),
    );
  }
}
