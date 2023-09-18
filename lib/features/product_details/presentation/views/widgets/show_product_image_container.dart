import 'package:flutter/material.dart';

class ShowProductImageContainer extends StatelessWidget {
  const ShowProductImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.338,
      height: MediaQuery.of(context).size.height / 1.9,
      decoration: const BoxDecoration(
        color: Color(0xffF6EAEC),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            16,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            right: 20,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: const Icon(
                Icons.favorite_outline_sharp,
                size: 25,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/product_details/s_1-removebg-preview.png',
            ),
          ),
        ],
      ),
    );
  }
}
