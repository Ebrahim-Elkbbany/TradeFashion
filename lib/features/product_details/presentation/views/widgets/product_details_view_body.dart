import 'package:flutter/material.dart';
import 'package:trade_fashion/features/home/presentation/manger/home_cubit.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/details_section.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_details_button_section.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_images_column.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/product_specifications_container.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/select_color_container.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/show_product_image_container.dart';

import '../../../../home/data/models/product_model.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({Key? key, this.productModelProduct}) : super(key: key);
  final ProductModelProduct? productModelProduct;
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImagesColumn(productModelProduct:productModelProduct),
               Padding(
                 padding: const EdgeInsets.only(top:20),
                 child: ShowProductImageContainer(productModelProduct:productModelProduct),
               ),
            ],
          ),
           DetailsSection(productModelProduct:productModelProduct),
          const ProductSpecificationContainer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(thickness: 0.6),
          ),
          const  SelectColorContainer(),
           const SizedBox(height: 20,),
           AddCardButtonSection(productModelProduct:productModelProduct),
        ],
      ),
    );
  }
}
