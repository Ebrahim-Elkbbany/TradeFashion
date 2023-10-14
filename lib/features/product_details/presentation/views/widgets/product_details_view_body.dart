import 'package:flutter/material.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/details_section.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_details_button_section.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_images_column.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_specifications_container.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/select_color_container.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/show_product_image_container.dart';


class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody(
      {Key? key,
      required this.mainImage,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.name,
      required this.price,
      required this.productId})
      : super(key: key);
  final String mainImage;
  final String image1;
  final String image2;
  final String image3;
  final String name;
  final String price;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImagesColumn(
                mainImage: mainImage,
                image1: image1,
                image2: image2,
                image3: image3,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ShowProductImageContainer(
                  mainImage: mainImage,
                  image1: image1,
                  image2: image2,
                  image3: image3,
                  productName: name,
                  price: price,
                  productId:productId,
                ),
              ),
            ],
          ),
          DetailsSection(
            name: name,
          ),
          const ProductSpecificationContainer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(thickness: 0.6),
          ),
          const SelectColorContainer(),
          const SizedBox(
            height: 20,
          ),
          AddCardButtonSection(
            name: name,
            productId: productId,
            price: price,
            mainImage: mainImage,
          ),
        ],
      ),
    );
  }
}
