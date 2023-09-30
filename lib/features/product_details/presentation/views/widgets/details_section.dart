import 'package:flutter/material.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({Key? key, required this.name, }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 23,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    border: Border.all(color: Colors.black12)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      Text('4.9',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: Text(
            'Wireless Over-ear Industry Loading Noise Canceling Headphones With Microphone',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
