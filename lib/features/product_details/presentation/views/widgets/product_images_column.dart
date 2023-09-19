import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/features/product_details/presentation/manger/product_details_cubit/product_details_cubit.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/pruduct_images_container.dart';
import '../../../../home/data/models/product_model.dart';

class ProductImagesColumn extends StatelessWidget {
  const ProductImagesColumn({Key? key, required this.productModelProduct})
      : super(key: key);
  final ProductModelProduct? productModelProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          var cubit=ProductDetailsCubit.get(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black12)),
                child: IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back, size: 25)),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  cubit.changeImage(0);
                },
                child: ProductImagesContainer(
                  image: productModelProduct!.imageUrl!,
                  color:cubit.selected==0? const Color(0xffe64660): Colors.black12,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  cubit.changeImage(1);
                },
                child: ProductImagesContainer(
                  image: productModelProduct!.additionalImageUrls![0],
                  color:cubit.selected==1? const Color(0xffe64660): Colors.black12,

                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: (){
                  cubit.changeImage(2);
                },
                child: ProductImagesContainer(
                  image: productModelProduct!.additionalImageUrls![1],
                  color:cubit.selected==2? const Color(0xffe64660): Colors.black12,

                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: (){
                  cubit.changeImage(3);
                  print(cubit.indexImage);
                },
                child: ProductImagesContainer(
                  image: productModelProduct!.additionalImageUrls![2],
                  color:cubit.selected==3? const Color(0xffe64660): Colors.black12,

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
