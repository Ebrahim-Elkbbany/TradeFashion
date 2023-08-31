import 'package:flutter/cupertino.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/address_view_container.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: [
          SizedBox(height: 20,),
          AddressViewContainer(
            streetName: 'mahmoud fffdfdffdfgddf hgghfhf',
            city: 'mansoura',
            governorate: 'Dakota 83475',
          ),
          SizedBox(
            height: 12,
          ),
          AddressViewContainer(
            streetName: '2715 Ash Dr. San Jose,South',
            city: 'mansoura',
            governorate: 'Dakota 83475',
          ),
        ],
      ),
    );
  }
}
