import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/widgets/custom_circular_indicator.dart';
import 'package:trade_fashion/core/widgets/custom_error_widget.dart';
import 'package:trade_fashion/features/home/presentation/manger/home_cubit.dart';
import '../../../../home/presentation/views/widgets/list_view_product_item.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({Key? key, required this.categoryId}) : super(key: key);
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    HomeCubit.get(context).getProduct(categoryId: categoryId);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hoodies (240)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if(state is HomeSuccess){
            return GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              crossAxisCount:MediaQuery.of(context).size.width.toInt()<750 ?2:6,
              mainAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width.toInt()<560 ?1 / 1.8: 1 / 1.2,
              crossAxisSpacing: 10,
              children: List.generate(
                state.productModel.products!.length,
                    (index) {
                  return  Center(
                    child: ListViewProductItem(productModelProduct: state.productModel.products![index]),
                  );
                },
              ),
            );
          }else if(state is HomeFailure){
            return CustomErrorWidget(errorMessage: state.errorMessage);
          }else{
            return const CustomCircularIndicator();
          }

        },
      ),
    );
  }
}
