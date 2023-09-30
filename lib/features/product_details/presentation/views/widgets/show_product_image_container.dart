import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../favourites/presentation/manger/favourites_cubit/favourites_cubit.dart';
import '../../manger/product_details_cubit/product_details_cubit.dart';

class ShowProductImageContainer extends StatelessWidget {
  const ShowProductImageContainer({Key? key,
    required this.mainImage,
    required this.image1,
    required this.image2,
    required this.image3, required this.productName, required this.price, required this.productId})
      : super(key: key);
  final String mainImage;
  final String image1;
  final String image2;
  final String image3;
  final String productName;
  final String price;
  final String productId;

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width / 1.338,
      height: MediaQuery
          .of(context)
          .size
          .height / 1.9,
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          var cubit = ProductDetailsCubit.get(context);
          if (cubit.indexImage == 0) {
            imageUrl = 'http://$mainImage';
          } else if (cubit.indexImage == 1) {
            imageUrl = 'http://$image1';
          } else if (cubit.indexImage == 2) {
            imageUrl = 'http://$image2';
          } else {
            imageUrl = 'http://$image3';
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
                  child: GestureDetector(
                    onTap: () {
                      FavouritesCubit.get(context).insertFavourite(
                          productName: productName,
                          price: price,
                          image: mainImage,
                          image1: image1,
                          image2: image2,
                          image3: image3,
                          productId: productId);
                    },
                    child: const Icon(
                      Icons.favorite_outline_sharp,
                      size: 25,
                    ),
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
