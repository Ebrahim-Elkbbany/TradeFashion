
import 'package:flutter/material.dart';
import 'package:trade_fashion/features/home/data/models/product_model.dart';
import '../../../../../core/utils/styles.dart';

class ListViewProductItem extends StatelessWidget {
  const ListViewProductItem({
    this.productModelProduct ,
    super.key,
  });
  final ProductModelProduct? productModelProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Image.network('http://${productModelProduct!.imageUrl}',),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(productModelProduct!.name!,style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,maxLines: 2),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(productModelProduct!.price!.current!.text!,style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),),
                )

              ]),
          GestureDetector(
              onTap: (){},
              child:const Padding(
                padding:  EdgeInsets.all(8.0),
                child:  Icon(Icons.favorite_outline),
              ))        ],
      ),
    );
  }
}
