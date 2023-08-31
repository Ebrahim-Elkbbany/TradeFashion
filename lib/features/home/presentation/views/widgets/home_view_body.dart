import 'package:flutter/material.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';
import 'package:trade_fashion/features/home/presentation/views/widgets/product_list_view.dart';

import '../../../../../core/utils/assets.dart';
import 'category_list_view.dart';
import 'list_view_product_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Image.asset(AssetsData.profile),
          title: Container(
            width: 73,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xffF4F4F4),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(children: [
                Text(
                  "Men",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                Icon(Icons.keyboard_arrow_down_outlined)
              ]),
            ),
          ),
          actions: [
            Image.asset(AssetsData.cardImage),
          ],
        ),
        body:const SingleChildScrollView(
          child: Column(children: [
             CustomTextFormField(
              boarderRadius: 100,
              prefix: Icons.search_outlined,
              hintText: 'search',
            ),
             SizedBox(
              height: 24,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
             SizedBox(
              height: 16,
            ),
            CategoryListView(),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Selling',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
             SizedBox(
              height: 24,
            ),
            ProductListView(),
             SizedBox(
              height: 24,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New In',
                  style: TextStyle(color:kPrimaryColor,fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
             SizedBox(
              height: 24,
            ),
            ProductListView(),

          ]),
        ),
      ),
    );
  }
}


