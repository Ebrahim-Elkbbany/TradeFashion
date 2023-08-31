import 'package:flutter/material.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/add_card_form.dart';

class AddCardFloatingActionButton extends StatelessWidget {
  const AddCardFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child:  const SingleChildScrollView(
                child: AddCardForm(),
              ),
            ) ;
          },
        );
      },
      child: const Icon(Icons.add),
      backgroundColor: kPrimaryColor,
    );
  }
}
