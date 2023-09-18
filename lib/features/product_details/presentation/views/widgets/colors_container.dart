import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        border: Border.all(color: Colors.black12),
        color: color,
      ),
    );
  }
}
