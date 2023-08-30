import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'manger/layout_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);
//well done
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit=LayoutCubit.get(context);
        return Scaffold(
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomScreen(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_sharp,), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notification_important_sharp,), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel,), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person,), label: ''),
            ],
          ),
        );
      },
    );
  }
}
