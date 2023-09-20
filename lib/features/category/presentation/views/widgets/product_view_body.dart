import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/widgets/custom_circular_indicator.dart';
import 'package:trade_fashion/core/widgets/custom_error_widget.dart';
import 'package:trade_fashion/features/category/presentation/manger/category_product_cubit/category_product_cubit.dart';
import '../../../../home/presentation/views/widgets/list_view_product_item.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);
  final int categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocProvider(
        create: (context) =>CategoryProductCubit()..getCategoryProduct(categoryId: categoryId),
        child: BlocBuilder<CategoryProductCubit, CategoryProductState>(
          builder: (context, state) {
            if (state is CategoryProductSuccess) {
              return GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                crossAxisCount:
                MediaQuery.of(context).size.width.toInt() < 750 ? 2 : 6,
                mainAxisSpacing: 10,
                childAspectRatio:
                MediaQuery.of(context).size.width.toInt() < 560
                    ? 1 / 1.8
                    : 1 / 1.2,
                crossAxisSpacing: 10,
                children: List.generate(
                  state.categoryProductModel.products!.length,
                      (index) {
                    return Center(
                      child: ListViewProductItem(
                          productModelProduct:
                          state.categoryProductModel.products![index]),
                    );
                  },
                ),
              );
            } else if (state is CategoryProductFailure) {
              return CustomErrorWidget(errorMessage: state.errorMessage);
            } else {
              return const CustomCircularIndicator();
            }
          },
        ),
      ),

    );
  }
}
