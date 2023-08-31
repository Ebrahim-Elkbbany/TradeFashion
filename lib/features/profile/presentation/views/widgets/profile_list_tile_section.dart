import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/profile_list_tile.dart';


class ProfileListTileSection extends StatelessWidget {
  const ProfileListTileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileListTile(
          leadingText: 'Address',
          onTap: () {
            GoRouter.of(context).push(AppRouter.kAddressView);
          },
        ),
        const SizedBox(
          height: 8,
        ),
        ProfileListTile(
          leadingText: 'Wishlist',
          onTap: () {},
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
        ProfileListTile(
          leadingText: 'Help',
          onTap: () {},
        ),
        const SizedBox(
          height: 8,
        ),
        ProfileListTile(
          leadingText: 'Support',
          onTap: () {},
        ),
      ],
    );
  }
}