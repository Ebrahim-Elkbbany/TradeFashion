import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../category/data/category_repo.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key, required this.categoryRepo,
  });
final CategoryRepo categoryRepo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Center(
        child: ListView.separated(
          padding: EdgeInsetsDirectional.zero,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: (){
                GoRouter.of(context).push(AppRouter.kCategoryItemView);
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:AssetImage(categoryRepo.pageItems[index].image,),) ,
                  const Spacer(),
                     Text(categoryRepo.pageItems[index].title,style: Styles.textStyle16.copyWith(fontSize: 14)),
                ],),
            ),
            separatorBuilder: (context, index) =>const SizedBox(width: 15,),
            itemCount: categoryRepo.pageItems.length),
      ),
    );
  }
}
