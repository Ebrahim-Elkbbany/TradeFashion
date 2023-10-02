import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/constants.dart';
import '../auth/presentation/manger/auth_cubit.dart';
import '../favourites/presentation/manger/favourites_cubit/favourites_cubit.dart';
import 'manger/layout_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);
//well done
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
         FavouritesCubit.get(context).getFavourite();
         AuthCubit.get(context).getUsersByEmail(token!);
        var cubit=LayoutCubit.get(context);
        return Scaffold(
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: kPrimaryColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomScreen(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_sharp,), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category,), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_sharp,), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person,), label: ''),
            ],
          //
          ),
        );
      },
    );
  }
}
