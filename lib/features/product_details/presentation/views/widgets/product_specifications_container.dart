import 'package:flutter/material.dart';

class ProductSpecificationContainer extends StatelessWidget {
  const ProductSpecificationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: const Color(
                0xffF6EAEC,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(
                8.0,
              ),
              child: Icon(
                Icons.event_note_outlined,
                color: Color(
                  0xffe64660,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text(
            'Product Specifications',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
