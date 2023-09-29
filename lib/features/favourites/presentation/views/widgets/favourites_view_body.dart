import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/widgets/custom_circular_indicator.dart';
import 'package:trade_fashion/core/widgets/custom_error_widget.dart';
import 'package:trade_fashion/features/favourites/presentation/manger/favourites_cubit/favourites_cubit.dart';
import 'package:trade_fashion/features/favourites/presentation/views/widgets/favourites_list_item.dart';

import '../../../../category/presentation/manger/category_product_cubit/category_product_cubit.dart';
import '../../../../home/data/models/product_model.dart';


class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({
    Key? key, required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourites',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocBuilder<FavouritesCubit, FavouritesState>(

        builder: (context, state) {
          var cubit =FavouritesCubit.get(context);
          if (state is GetFavouritesSuccessState) {
            return GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              crossAxisCount:
                  MediaQuery.of(context).size.width.toInt() < 750 ? 2 : 6,
              mainAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width.toInt() < 560
                  ? 1 / 1.8
                  : 1 / 1.2,
              crossAxisSpacing: 10,
              children: List.generate(
                state.favouritesList!.length,
                (index) {
                  return Center(
                      child: ListViewFavouriteItem(
                    productModelProduct: CategoryProductCubit.get(context).categoryProductModel!.products![index],
                    name: state.favouritesList![index]['productName'].toString(),
                    price: state.favouritesList![index]['price'].toString(),
                    image: state.favouritesList![index]['image'].toString(),
                   productId: state.favouritesList![index]['productId'].toString(),
                   ),
                  );
                },
              ),
            );
          } else if (state is GetFavouritesErrorState) {
            return CustomErrorWidget(errorMessage: state.error);
          } else {
            cubit.getFavourite();
            return const CustomCircularIndicator();
          }
        },
      ),
    );
  }
}
