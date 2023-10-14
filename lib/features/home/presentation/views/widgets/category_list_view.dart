import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/features/category/presentation/views/product_view.dart';
import '../../../../category/data/category_repo.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
    required this.categoryRepo,
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
            itemBuilder: (context, index) => Builder(builder: (context) {
                  return InkWell(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductView(
                            categoryId: categoryRepo.pageItems[index].id,
                            categoryName: categoryRepo.pageItems[index].title,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            categoryRepo.pageItems[index].image,
                          ),
                        ),
                        const Spacer(),
                        Text(categoryRepo.pageItems[index].title,
                            style: Styles.textStyle16.copyWith(fontSize: 14)),
                      ],
                    ),
                  );
                }),
            separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
            itemCount: categoryRepo.pageItems.length),
      ),
    );
  }
}
