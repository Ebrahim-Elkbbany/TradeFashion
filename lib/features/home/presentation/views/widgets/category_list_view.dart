import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              Image.asset(AssetsData.categoryImage),
              const SizedBox(height: 24,),
              const   Text('Hoodies',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),)
            ],),
          separatorBuilder: (context, index) =>const SizedBox(width: 15,),
          itemCount: 15),
    );
  }
}