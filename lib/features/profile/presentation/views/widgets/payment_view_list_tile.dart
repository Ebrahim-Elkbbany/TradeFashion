import 'package:flutter/material.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/styles.dart';
class PaymentViewListTile extends StatelessWidget {
  const PaymentViewListTile({Key? key, this.onTap, required this.cardNumber}) : super(key: key);
  final void Function()? onTap;
  final String cardNumber;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Text(cardNumber,style: Styles.textStyle16),
        trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.black),
      ),
    );
  }
}
