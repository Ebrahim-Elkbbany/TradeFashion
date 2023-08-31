import 'package:flutter/material.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/add_card_floating_button.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/payment_view_body.dart';


class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
        ),
        centerTitle: true,
      ),
      body: const PaymentViewBody(),
      floatingActionButton: const AddCardFloatingActionButton(),
    );
  }
}
