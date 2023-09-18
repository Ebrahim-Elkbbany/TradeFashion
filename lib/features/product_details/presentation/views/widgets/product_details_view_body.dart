
import 'package:flutter/material.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/details_section.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_details_button_section.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_images_column.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_specifications_container.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/select_color_container.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/show_product_image_container.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImagesColumn(),
            ShowProductImageContainer(),
          ],
        ),
        DetailsSection(),
        ProductSpecificationContainer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(thickness: 0.6),
        ),
        SelectColorContainer(),
        Spacer(),
        AddCardButtonSection(),
      ],
    );
  }
}
