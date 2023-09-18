import 'package:flutter/material.dart';

class AddCardButton extends StatelessWidget {
  const AddCardButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffe64660),
          borderRadius: BorderRadius.circular(16),
        ),
        height: 50,        width: 200,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add To Card',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,),),
            Icon(
              Icons.arrow_forward_ios_outlined, color: Colors.white, size: 22,),
          ],
        ),
      ),
    );
  }
}
