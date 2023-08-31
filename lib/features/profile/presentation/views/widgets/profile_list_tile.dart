import 'package:flutter/material.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({Key? key, this.onTap, required this.leadingText}) : super(key: key);
  final void Function()? onTap;
  final String leadingText;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Text(leadingText,style: Styles.textStyle16),
        trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.black),
      ),
    );
  }
}
