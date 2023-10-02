import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:trade_fashion/features/favourites/presentation/views/favourites_view.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/profile_list_tile.dart';

import '../../../../../core/utils/component.dart';
import '../../../../home/presentation/manger/home_cubit.dart';


class ProfileListTileSection extends StatelessWidget {
  const ProfileListTileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileListTile(
          leadingText: 'Favorite',
          onTap: () {
            navigateTo(context,FavouritesView(productModel: HomeCubit.get(context).productModel!));
          },
        ),
        const SizedBox(
          height: 8,
        ),
        ProfileListTile(
          leadingText: 'Theme',
          onTap: () {
            GoRouter.of(context).push(AppRouter.kThemeViewPath);
          },
        ),
        const SizedBox(
          height: 8,
        ),
        ProfileListTile(
          leadingText: 'Payment',
          onTap: () {
            GoRouter.of(context).push(AppRouter.kPaymentView);
          },
        ),
        const SizedBox(
          height: 8,
        ),

      ],
    );
  }
}
