import 'package:flutter/material.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/assets.dart';
import 'package:trade_fashion/core/utils/styles.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  final String name;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 100,
      child: Row(
        children: [
          Image.network(image, height: 80, width: 80, fit: BoxFit.cover),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  children: [
                    Text(
                      'Size -',
                      style: Styles.textStyle16.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'M',
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Color -',
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle16.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'Black',
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                price,
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: kPrimaryColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: kPrimaryColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
