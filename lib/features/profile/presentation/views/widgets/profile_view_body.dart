import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:trade_fashion/core/utils/assets.dart';
import 'package:trade_fashion/core/utils/shared_prefrence.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_text_button.dart';
import 'package:trade_fashion/features/layout/manger/layout_cubit.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/profile_info_container.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/profile_list_tile_section.dart';

import '../../../../../constants.dart';


class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 76,
              ),
              Image.asset(
                AssetsData.profileImage,
              ),
              const SizedBox(
                height: 55,
              ),
              const ProfileInfoContainer(),
              const SizedBox(
                height: 26,
              ),
              const ProfileListTileSection(),
              const SizedBox(
                height: 35,
              ),
              CustomTextButton(
                onPressed: (){
                  SharedPreference.removeData(key: 'tokenEmail').then((value) {
                    GoRouter.of(context).push(AppRouter.kLoginView);
                    LayoutCubit.get(context).currentIndex =0;
                  });
                },
                text: 'Sign Out',
                textStyle: Styles.textStyle16.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
