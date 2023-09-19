import 'package:flutter/material.dart';
import 'widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key, required this.categoryId}) : super(key: key);
  final int  categoryId ;
  @override
  Widget build(BuildContext context) {
    return  ProductViewBody(categoryId: categoryId,);
  }
}
