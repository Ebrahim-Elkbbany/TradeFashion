import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:trade_fashion/features/auth/presentation/manger/auth_cubit.dart';
import 'package:trade_fashion/features/favourites/presentation/manger/favourites_cubit/favourites_cubit.dart';
import 'package:trade_fashion/features/home/data/models/product_model.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../product_details/presentation/views/product_details_view.dart';

class ListViewProductItem extends StatelessWidget {
  const ListViewProductItem({
    this.productModelProduct,
    super.key,
  });

  final ProductModelProduct? productModelProduct;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductDetailsView(productModelProduct: productModelProduct),
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
                FavouritesCubit.get(context).favoriteItems.any(
                      (item) => item == productModelProduct!.id.toString(),
                )
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color: FavouritesCubit.get(context).favoriteItems.any(
                      (item) => item == productModelProduct!.id.toString(),
                )
                    ? kPrimaryColor
                    : null,
              ),
              onPressed: () {
                FavouritesCubit.get(context).insertFavourite(
                  productName: productModelProduct!.name!,
                  price: productModelProduct!.price!.current!.text!,
                  image: 'http://${productModelProduct!.imageUrl}',
                  productId: "${productModelProduct!.id}",
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
