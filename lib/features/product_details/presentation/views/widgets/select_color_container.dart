import 'package:flutter/material.dart';
import 'package:trade_fashion/features/product_details/presentation/views/widgets/colors_container.dart';

class SelectColorContainer extends StatelessWidget {
  const SelectColorContainer({Key? key}) : super(key: key);

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
                Icons.color_lens_outlined,
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
            'Colors',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          const ColorContainer(color: Colors.black54),
          const SizedBox(
            width: 5,
          ),
          const ColorContainer(color: Colors.black12),
          const SizedBox(
            width: 5,
          ),
          const ColorContainer(color: Colors.white),
        ],
      ),
    );
  }
}
