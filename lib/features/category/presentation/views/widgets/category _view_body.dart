import 'package:flutter/material.dart';
import '../../../data/category_repo.dart';
import 'cat_grid_view_item.dart';
class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           leading: Text(''),
          title: const Text(
            'Category',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1/1.49,
            children: List.generate(
              CategoryRepo().pageItems.length, (index) => CatGridViewItem(categoryRepo:CategoryRepo(),index:index ),
            ),
          ),
        ),
    );
  }
}


//      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Expanded(
//           child: ListView.separated(
//             physics: const BouncingScrollPhysics(),
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//             itemBuilder: (context, index) => InkWell(
//               onTap: () {
//                 GoRouter.of(context).push(AppRouter.kCategoryItemView);
//               },
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsetsDirectional.all(12),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: const Color(0xffF4F4F4),
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Image.asset(AssetsData.profile),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       'Hoodies',
//                       style: Styles.textStyle16
//                           .copyWith(fontWeight: FontWeight.w500),
//                     ),
//                     const Spacer(),
//                     const Icon(
//                       Icons.arrow_forward_ios,
//                       size: 20,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             separatorBuilder: (context, index) => const SizedBox(
//               height: 16,
//             ),
//             itemCount: 9,
//           ),
//         )
//       ]),
