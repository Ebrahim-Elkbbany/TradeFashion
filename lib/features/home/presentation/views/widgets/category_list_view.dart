import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/styles.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Center(
        child: ListView.separated(
          padding: EdgeInsetsDirectional.zero,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: (){
                GoRouter.of(context).push(AppRouter.kCategoryItemView);
              },
              child: Column(
                children: [
                  Image.asset(AssetsData.categoryImage,height: 110),
                  Spacer(),
                     Text('Hoodies',style: Styles.textStyle16.copyWith(fontSize: 14)),
                ],),
            ),
            separatorBuilder: (context, index) =>const SizedBox(width: 15,),
            itemCount: 15),
      ),
    );
  }
}
