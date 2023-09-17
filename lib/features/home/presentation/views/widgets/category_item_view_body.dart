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
        if(MediaQuery.of(context).size.width.toInt()<560) {
          return GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            crossAxisCount:2,
            mainAxisSpacing: 10,
            childAspectRatio: 1 / 1.7,
            crossAxisSpacing: 10,
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
         physics: const BouncingScrollPhysics(),
          crossAxisCount:6,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 1.2,
          crossAxisSpacing: 5,
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
