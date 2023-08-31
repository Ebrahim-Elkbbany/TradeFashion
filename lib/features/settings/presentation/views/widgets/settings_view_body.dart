import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/assets.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_text_button.dart';
import 'package:trade_fashion/features/settings/presentation/views/widgets/profile_info_container.dart';
import 'package:trade_fashion/features/settings/presentation/views/widgets/profile_list_tile_section.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({Key? key}) : super(key: key);

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

                },
                text: 'Sign Out',
                textStyle: Styles.textStyle16.copyWith(
                  color: const Color(0xffFA3636),
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
