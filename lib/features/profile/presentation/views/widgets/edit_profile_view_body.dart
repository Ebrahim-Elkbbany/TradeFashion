import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/assets.dart';
import 'package:trade_fashion/core/widgets/custom_button.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/edit_profile_view_text_field_sec.dart';


class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 42,
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AssetsData.profileImage,
                    ),
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const EditProfileViewTextFieldSec(),
              const SizedBox(height: 70),
              CustomButton(
                buttonName: 'Save Changes',
                radius: 8,
                onPressed: () {
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}



