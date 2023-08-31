import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_fashion/core/utils/assets.dart';
import 'package:trade_fashion/core/utils/styles.dart';

import '../../../../../core/utils/app_router.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xffF4F4F4),
              child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Shop by Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>  InkWell(
                        onTap: (){
                          GoRouter.of(context).push(AppRouter.kCategoryItemView);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 64,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffF4F4F4)),
                          child:
                          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                            const SizedBox(
                              width: 16,
                            ),
                            Image.asset(AssetsData.profile),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Hoodies',
                              style: Styles.textStyle16,
                            )
                          ]),
                        ),
                      ) ,
                      separatorBuilder: (context, index) => const SizedBox(height: 16,),
                      itemCount: 9),
                )

          ]),
        ),
      ),
    );
  }
}
