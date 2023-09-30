import 'package:flutter/material.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import '../../manger/cart_cubit.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.cubit,
    required this.productId,
    required this.quantity,
    required this.indexItem,
  });

  final CartCubit cubit;
  final String name;
  final String price;
  final int quantity;
  final int indexItem;
  final String image;
  final String productId;

  @override
  Widget build(BuildContext context) {
     String intPrice=price.characters.getRange(1).string;
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.network('http://$image', height: 80, width: 80, fit: BoxFit.cover),
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
                      'Num -',
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${quantity}P',
                      style: Styles.textStyle16.copyWith(
                        color: Colors.black54,
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
                '${double.parse(intPrice).round()*quantity} \$' ,
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
                        onPressed: () {
                          cubit.changeQuantity(
                              quantity + 1, productId, indexItem);
                        },
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
                        onPressed: () {
                          if (quantity == 1) {
                            cubit.deleteCartItem(
                                indexItem: indexItem, productId: productId);
                          }
                          cubit.changeQuantity(
                              quantity - 1, productId, indexItem);
                        },
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
