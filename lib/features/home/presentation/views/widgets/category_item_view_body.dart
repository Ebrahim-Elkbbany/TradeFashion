import 'package:flutter/material.dart';
import 'list_view_product_item.dart';

class CategoryItemViewBody extends StatelessWidget {
  const CategoryItemViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 10.0),
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
            const   Text(
              'Hoodies (240)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),

            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                childAspectRatio: 1 / 1.6,
                crossAxisSpacing: 15,
                children: List.generate(
                  10,
                      (index) {
                    return const Center(child:  ListViewProductItem());
                  },
                ),
              ),
            ),
          ]),
        ),
      ),

    );
  }
}
