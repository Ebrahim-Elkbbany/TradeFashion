import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_circular_indicator.dart';
import 'package:trade_fashion/core/widgets/custom_error_widget.dart';
import 'package:trade_fashion/core/widgets/custom_text_button.dart';
import 'package:trade_fashion/features/auth/presentation/manger/auth_cubit.dart';
import 'package:trade_fashion/features/cart/presentation/views/widgets/checout_sec.dart';
import 'package:trade_fashion/features/cart/presentation/views/widgets/list_view_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context)..getCart();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is GetCartSuccessState) {
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
                  itemCount: state.cartList!.length,
                  itemBuilder: (context, index) {
                    return ListViewItem(
                      name: state.cartList![index]['productName'].toString(),
                      price: state.cartList![index]['price'].toString(),
                      image: state.cartList![index]['image'].toString(),
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const CheOutSec(),
              ],
            ),
          );
        } else if (state is GetCartErrorState){
          return CustomErrorWidget(errorMessage: state.error);
        }else{
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
