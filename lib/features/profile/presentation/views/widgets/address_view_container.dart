import 'package:flutter/material.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_text_button.dart';

class AddressViewContainer extends StatelessWidget {
  const AddressViewContainer({Key? key, this.onPressed, required this.streetName, required this.governorate, required this.city}) : super(key: key);
  final void Function()? onPressed;
  final String streetName;
  final String city;
  final String governorate;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  streetName,
                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16
                ),
                Text(
                    city,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16
                ),
                Text(
                  governorate,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16
                ),
              ],
            ),
            CustomTextButton(
              onPressed: onPressed,
              text: 'Edit',
              textStyle: Styles.textStyle12.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
