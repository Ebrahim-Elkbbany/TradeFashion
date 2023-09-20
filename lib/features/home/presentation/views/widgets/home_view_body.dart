import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/widgets/custom_circular_indicator.dart';
import 'package:trade_fashion/core/widgets/custom_error_widget.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';
import 'package:trade_fashion/features/home/presentation/manger/home_cubit.dart';
import 'package:trade_fashion/features/home/presentation/views/widgets/product_list_view.dart';
import 'package:trade_fashion/features/layout/manger/layout_cubit.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../category/data/category_repo.dart';
import 'category_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {

        if (state is HomeSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(AssetsData.profile),
                        const Spacer(),
                        Image.asset(AssetsData.cardImage),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomTextFormField(
                      boarderRadius: 100,
                      prefix: Icons.search_outlined,
                      prefixColor: kPrimaryColor,
                      hintText: 'search',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        InkWell(
                          onTap: () {
                            LayoutCubit.get(context).changeBottomScreen(1);
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CategoryListView(categoryRepo: CategoryRepo()),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Product',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ProductListView(productModel: state.productModel),
                  ]),
            ),
          );
        } else if (state is HomeFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
