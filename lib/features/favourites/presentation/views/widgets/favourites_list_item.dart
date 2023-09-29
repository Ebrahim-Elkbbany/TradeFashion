import 'package:flutter/material.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/features/favourites/presentation/manger/favourites_cubit/favourites_cubit.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/presentation/manger/category_product_cubit/category_product_cubit.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../../product_details/presentation/views/product_details_view.dart';

class ListViewFavouriteItem extends StatelessWidget {
  const ListViewFavouriteItem({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.productId,
    required this.productModelProduct,

  });

  final String name;
  final String price;
  final String image;
  final String productId;
  final ProductModelProduct productModelProduct;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsView(
                productModelProduct:productModelProduct
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
                image,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(name,
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
                  price,
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),
                ),
              )
            ]),
            IconButton(
              icon: Icon(
                FavouritesCubit.get(context).favoriteItems.any(
                          (item) => item == productId,
                        )
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color: FavouritesCubit.get(context).favoriteItems.any(
                          (item) => item == productId,
                        )
                    ? kPrimaryColor
                    : null,
              ),
              onPressed: () {
                FavouritesCubit.get(context).insertFavourite(
                  productName: name,
                  price: price,
                  image: image,
                  productId: productId,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
