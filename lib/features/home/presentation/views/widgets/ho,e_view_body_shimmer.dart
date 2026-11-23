import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/assets.dart';
import 'package:trade_fashion/core/utils/component.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/core/widgets/custom_text_form_field.dart';
import 'package:trade_fashion/features/category/data/category_repo.dart';
import 'package:trade_fashion/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:trade_fashion/features/layout/manger/layout_cubit.dart';
import 'package:trade_fashion/features/search/presentation/views/search_view.dart';

class HomeViewBodyShimmer extends StatelessWidget {
  const HomeViewBodyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AssetsData.profile),
                Text(
                  'Home',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image.asset(AssetsData.lockImage),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              onTap: () {
                navigateTo(context, const SearchView());
              },
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    LayoutCubit.get(context).changeBottomScreen(1);
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 120,
              child: Center(
                child: ListView.separated(
                    padding: EdgeInsetsDirectional.zero,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Builder(builder: (context) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Row(
                          children: List.generate(
                            5, // Adjust the number of shimmer items as needed
                                (index) => Container(
                              width: 100,
                              height: 120,
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                    itemCount: 10,),
              ),
            ),
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
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount:
                  MediaQuery.of(context).size.width.toInt() < 750 ? 2 : 6,
              mainAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width.toInt() < 560
                  ? 1 / 1.8
                  : 1 / 1.2,
              crossAxisSpacing: 10,
              children: List.generate(
                10,
                (index) {
                  return Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffF4F4F4),
                        ),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 100,
                                  // Set a fixed height for the shimmer image
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    width: 150,
                                    // Set a fixed width for the shimmer text
                                    height: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    width: 100,
                                    // Set a fixed width for the shimmer text
                                    height: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 40,
                              // Set a fixed width for the shimmer icon
                              height: 40,
                              // Set a fixed height for the shimmer icon
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
