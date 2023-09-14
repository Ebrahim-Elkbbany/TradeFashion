import 'package:flutter/material.dart';
import 'list_view_product_item.dart';

class CategoryItemViewBody extends StatelessWidget {
  const CategoryItemViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:   const   Text(
        'Hoodies (240)',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),

      ),

      ),
      body: Builder(builder: (context) {
        if(MediaQuery.of(context).size.width.toInt()<=560) {
          return GridView.count(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            crossAxisCount:2,
            mainAxisSpacing: 15,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 15,
            children: List.generate(
              10,
                  (index) {
                return const Center(child:  ListViewProductItem());
              },
            ),
          );
        }
        return GridView.count(
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
          crossAxisCount:6,
          mainAxisSpacing: 15,
          childAspectRatio: 1 / 1.3,
          crossAxisSpacing: 15,
          children: List.generate(
            10,
                (index) {
              return const Center(child:  ListViewProductItem());
            },
          ),
        );
      },),
    );
  }
}
