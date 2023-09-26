
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../product_details/presentation/views/product_details_view.dart';

class ListViewFavouriteItem extends StatelessWidget {
  const ListViewFavouriteItem({

    super.key, required this.name, required this.price, required this.image,
  });
  final String name;
  final String price;
  final String image;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsView( ) ,));
      },
      child: Container(
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
                  Image.network(image,),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(name,style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,maxLines: 2),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(price,style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),),
                  )

                ]),
            IconButton(icon: const Icon(Icons.favorite_outline),onPressed: (){

            },
            ),
          ],
        ),
      ),
    );
  }
}
