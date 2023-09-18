import 'package:flutter/material.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/pruduct_images_container.dart';

class ProductImagesColumn extends StatelessWidget {
  const ProductImagesColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12)),
            child:  IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back, size: 25)),
          ),
          const SizedBox(
            height: 20,
          ),
          const ProductImagesContainer(
            image:'assets/images/product_details/s_1.jpg',
            color: Color(0xffe64660),
          ),
          const SizedBox(
            height: 15,
          ),
          const ProductImagesContainer(
            image:'assets/images/product_details/s_2.jpg',
          ),
          const SizedBox(
            height: 15,
          ),
          const ProductImagesContainer(
            image:'assets/images/product_details/s_3.jpg',
          ),
          const SizedBox(
            height: 15,
          ),
          const ProductImagesContainer(
            image:'assets/images/product_details/s_4.jpg',
          ),
        ],
      ),
    );
  }
}
