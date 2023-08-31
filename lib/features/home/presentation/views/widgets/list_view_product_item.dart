import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class ListViewProductItem extends StatelessWidget {
  const ListViewProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 281,
      width: 159,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:const Color(0xffF4F4F4),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AssetsData.productImage),
                const SizedBox(
                  height: 8,
                ),
                Text('Men\'s Harrington Jacket',style: Styles.textStyle12,),
                const SizedBox(
                  height: 8,
                ),
                const Text('148.00',style:TextStyle(fontSize: 12,fontWeight: FontWeight.w700),)

              ]),
          IconButton(icon: const Icon(Icons.favorite_outline),onPressed: (){}),
        ],
      ),
    );
  }
}