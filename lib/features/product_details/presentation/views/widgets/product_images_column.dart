import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/features/product_details/presentation/manger/product_details_cubit/product_details_cubit.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/pruduct_images_container.dart';
import '../../../../../constants.dart';

class ProductImagesColumn extends StatelessWidget {
  const ProductImagesColumn(
      {Key? key,
      required this.mainImage,
      required this.image1,
      required this.image2,
      required this.image3})
      : super(key: key);
  final String mainImage;
  final String image1;
  final String image2;
  final String image3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          var cubit = ProductDetailsCubit.get(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, size: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  cubit.changeImage(0);
                },
                child: ProductImagesContainer(
                  image: mainImage,
                  color: cubit.selected == 0
                      ?  kPrimaryColor
                      : Colors.black12,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  cubit.changeImage(1);
                },
                child: ProductImagesContainer(
                  image: image1,
                  color: cubit.selected == 1
                      ?kPrimaryColor
                      : Colors.black12,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  cubit.changeImage(2);
                },
                child: ProductImagesContainer(
                  image: image2,
                  color: cubit.selected == 2
                      ? kPrimaryColor
                      : Colors.black12,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  cubit.changeImage(3);
                  print(cubit.indexImage);
                },
                child: ProductImagesContainer(
                  image: image3,
                  color: cubit.selected == 3
                      ? kPrimaryColor
                      : Colors.black12,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        },
      ),
    );
  }
}
