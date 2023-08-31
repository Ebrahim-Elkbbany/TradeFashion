import 'package:flutter/material.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/add_address_floating_button.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/address_view_body.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Address',
        ),
        centerTitle: true,
      ),
      body: const AddressViewBody(),
      floatingActionButton: const AddAddressFloatingActionButton(),
    );
  }
}
