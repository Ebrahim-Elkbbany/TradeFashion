import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/assets.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/features/home/presentation/views/widgets/home_view_body.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../home/presentation/views/home_view.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(
          ModalRoute.of(context)!.settings.name!,
        ),
        title: const Text(
          'Category',
        ),
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kCategoryItemView);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsetsDirectional.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffF4F4F4),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AssetsData.profile),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Hoodies',
                        style: Styles.textStyle16
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
              itemCount: 9,
            ),
          )
        ]),
      ),
    );
  }
}
