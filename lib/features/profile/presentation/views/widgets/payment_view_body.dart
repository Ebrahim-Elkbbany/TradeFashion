import 'package:flutter/cupertino.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/payment_view_list_tile.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Text('Cards',style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          const PaymentViewListTile(cardNumber: '000000000000000000000'),
          const SizedBox(
            height: 12,
          ),
          const PaymentViewListTile(cardNumber: '000000000000000000000'),
        ],
      ),
    );
  }
}
