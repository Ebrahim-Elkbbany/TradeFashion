import 'package:flutter/material.dart';
import '../../../home/data/models/product_model.dart';
import 'widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView( {Key? key, required this.productModel, }) : super(key: key);
  final ProductModel productModel;


  @override
  Widget build(BuildContext context) {
    return  FavouritesViewBody(productModel: productModel,);
  }
}
