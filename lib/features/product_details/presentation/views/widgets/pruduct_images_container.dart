import 'package:flutter/material.dart';

class ProductImagesContainer extends StatelessWidget {
  const ProductImagesContainer(
      {Key? key, required this.image, this.color = Colors.black12})
      : super(key: key);
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color,width:2),
      ),
      child:  Image(
        width: 45,
        height: 45,
        image: NetworkImage("http://$image"),
        fit: BoxFit.fill,
      ),
    );
  }
}
