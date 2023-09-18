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
    // List<Color> colors = [
    //   Colors.amber,
    //   Colors.teal,
    //   Colors.brown,
    //   Colors.lightBlue,
    //   Colors.red,
    //   Colors.deepPurple,
    //   Colors.brown,
    //   Colors.lightBlue,
    //   Colors.amber,
    //   Colors.teal,
    //   Colors.brown,
    //   Colors.lightBlue,
    //   Colors.red,
    //   Colors.deepPurple,
    //   Colors.brown,
    //   Colors.lightBlue,
    // ];
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:const Color(0xffF4F4F4),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          categoryRepo.pageItems[index].image,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/3.9,
                child: Text(
                  categoryRepo.pageItems[index].title,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500 ),
                ),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white70,
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),

      ]),
    );
  }
}
