import 'package:flutter/material.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    Key? key,
    required this.mainImage,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.name,
    required this.price,
    required this.productId,
  }) : super(key: key);
  final String mainImage;
  final String image1;
  final String image2;
  final String image3;
  final String name;
  final String price;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ProductDetailsViewBody(
          mainImage: mainImage,
          image1:image1,
          image2: image2,
          image3: image3,
          name:name,
          price:price,
          productId:productId,
        ),
      ),
    );
  }
}
