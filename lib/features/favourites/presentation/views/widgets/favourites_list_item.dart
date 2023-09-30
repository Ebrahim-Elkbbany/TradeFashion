import 'package:flutter/material.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/features/favourites/presentation/manger/favourites_cubit/favourites_cubit.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../product_details/presentation/views/product_details_view.dart';

class ListViewFavouriteItem extends StatelessWidget {
  const ListViewFavouriteItem({
    super.key,
    required this.mainImage,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.name,
    required this.price,
    required this.productId, required this.index,
  });

  final String mainImage;
  final String image1;
  final String image2;
  final String image3;
  final String name;
  final String price;
  final String productId;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(image1);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsView(
                mainImage:mainImage,
                image1: image1,
                image2: image2,
                image3: image3,
                name: name,
                price: price,
                productId: productId,
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
                'http://$mainImage',
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
                FavouritesCubit.get(context).favouritesList![index]['isFavorite'].toString()=='true'
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color: FavouritesCubit.get(context).favouritesList![index]['isFavorite'].toString()=='true'
                    ? kPrimaryColor
                    : null,
              ),
              onPressed: () {
                FavouritesCubit.get(context).deleteFavourite(
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
