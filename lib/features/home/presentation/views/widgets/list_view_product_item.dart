import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/features/favourites/presentation/manger/favourites_cubit/favourites_cubit.dart';
import 'package:trade_fashion/features/home/data/models/product_model.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../product_details/presentation/views/product_details_view.dart';

class ListViewProductItem extends StatelessWidget {
  const ListViewProductItem({
    this.productModelProduct,
    super.key,
    required this.index,
  });

  final ProductModelProduct? productModelProduct;
  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit = FavouritesCubit.get(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsView(
                mainImage: productModelProduct!.imageUrl!,
                image1: productModelProduct!.additionalImageUrls![0],
                image2: productModelProduct!.additionalImageUrls![1],
                image3: productModelProduct!.additionalImageUrls![2],
                name: productModelProduct!.name!,
                price: productModelProduct!.price!.current!.value.toString(),
                productId: productModelProduct!.id!.toString(),
              ),
            ));
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffF4F4F4),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.network(
                'http://${productModelProduct!.imageUrl}',
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(productModelProduct!.name!,
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  productModelProduct!.price!.current!.text!,
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),
                ),
              )
            ]),
            BlocBuilder<FavouritesCubit, FavouritesState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(
                    cubit.favouritesList!.any(
                          (item) => item["productId"].toString()== productModelProduct!.id.toString(),
                    )
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color:
                    cubit.favouritesList!.any(
                          (item) => item["productId"].toString()== productModelProduct!.id.toString(),
                    )
                            ? kPrimaryColor
                            : null,
                  ),
                  onPressed: () {
                    FavouritesCubit.get(context).insertFavourite(
                      productName: productModelProduct!.name!,
                      price: productModelProduct!.price!.current!.text!,
                      image: productModelProduct!.imageUrl!,
                      productId: "${productModelProduct!.id}",
                      image1: productModelProduct!.additionalImageUrls![0],
                      image2: productModelProduct!.additionalImageUrls![1],
                      image3: productModelProduct!.additionalImageUrls![2],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
