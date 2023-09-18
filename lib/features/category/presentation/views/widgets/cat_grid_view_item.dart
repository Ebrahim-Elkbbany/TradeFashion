import 'package:flutter/material.dart';
import '../../../data/category_repo.dart';

class CatGridViewItem extends StatelessWidget {
  const CatGridViewItem({
    super.key,
    required this.categoryRepo,
    required this.index,
  });

  final CategoryRepo categoryRepo;
  final int index;

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.amber,
      Colors.teal,
      Colors.brown,
      Colors.lightBlue,
      Colors.red,
      Colors.deepPurple,
      Colors.brown,
      Colors.lightBlue,
      Colors.amber,
      Colors.teal,
      Colors.brown,
      Colors.lightBlue,
      Colors.red,
      Colors.deepPurple,
      Colors.brown,
      Colors.lightBlue,
    ];
    return Container(
      width: 170,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colors[index],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            categoryRepo.pageItems[index].title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Image.asset(
            categoryRepo.pageItems[index].image,
            height: 120,
            width: 110,
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
