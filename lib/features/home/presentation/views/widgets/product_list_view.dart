import 'package:flutter/material.dart';

import 'list_view_product_item.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 281,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const ListViewProductItem(),
          separatorBuilder: (context, index) =>const SizedBox(width: 15,),
          itemCount: 15),
    );
  }
}
