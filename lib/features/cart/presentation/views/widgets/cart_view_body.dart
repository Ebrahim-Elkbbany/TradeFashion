import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_circular_indicator.dart';
import 'package:trade_fashion/core/widgets/custom_error_widget.dart';
import 'package:trade_fashion/core/widgets/custom_text_button.dart';
import 'package:trade_fashion/features/cart/presentation/manger/cart_cubit.dart';
import 'package:trade_fashion/features/cart/presentation/views/widgets/checout_sec.dart';
import 'package:trade_fashion/features/cart/presentation/views/widgets/list_view_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCubit.get(context).getCart();
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit= CartCubit.get(context);
        if (state is! GetCartLoadingState &&state is!GetCartErrorState) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back_ios_new,)),
                    CustomTextButton(
                      onPressed: (){
                        cubit.deleteCart();
                      },
                      text: 'Remove All',
                      textStyle: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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
                  itemCount: cubit.cartList!.length,
                  itemBuilder: (context, index) {
                    return ListViewItem(
                      cubit:cubit,
                      indexItem: index,
                      quantity:int.parse(cubit.cartList![index]['quantity'].toString()),
                      // totalPrice: int.parse(cubit.cartList![index]['totalPrice'].toString()),
                      name: cubit.cartList![index]['productName'].toString(),
                      price: (cubit.cartList![index]['price']).toString(),
                      image: cubit.cartList![index]['image'].toString(),
                      productId:cubit.cartList![index]['productId'].toString() ,
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                  CheOutSec(cubit: cubit,),
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
