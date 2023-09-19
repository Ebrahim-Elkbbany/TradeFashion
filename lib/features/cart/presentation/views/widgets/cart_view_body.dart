import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_text_button.dart';
import 'package:trade_fashion/features/cart/presentation/views/widgets/checout_sec.dart';
import 'package:trade_fashion/features/cart/presentation/views/widgets/list_view_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextButton(
              text: 'Remove All',
              textStyle: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return const ListViewItem();
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const CheOutSec(),
        ],
      ),
    );
  }
}


