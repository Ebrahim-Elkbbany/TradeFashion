import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/product_model.dart';
import '../../manger/product_details_cubit/product_details_cubit.dart';

class ShowProductImageContainer extends StatelessWidget {
  const ShowProductImageContainer({Key? key, this.productModelProduct})
      : super(key: key);
  final ProductModelProduct? productModelProduct;

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.338,
      height: MediaQuery.of(context).size.height / 1.9,
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          var cubit = ProductDetailsCubit.get(context);
          if (cubit.indexImage == 0) {
            imageUrl = "http://${productModelProduct!.imageUrl!}";
          } else if (cubit.indexImage == 1) {
            imageUrl = "http://${productModelProduct!.additionalImageUrls![0]}";
          } else if (cubit.indexImage == 2) {
            imageUrl = "http://${productModelProduct!.additionalImageUrls![1]}";
          } else {
            imageUrl = "http://${productModelProduct!.additionalImageUrls![2]}";
          }

          return Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  imageUrl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Icon(
                    Icons.favorite_outline_sharp,
                    size: 25,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
