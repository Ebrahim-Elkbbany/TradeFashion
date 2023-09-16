import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/features/profile/presentation/views/profile_view.dart';
import '../../cart/presentation/views/cart_view.dart';
import '../../category/presentation/views/category _view.dart';
import '../../home/presentation/views/home_view.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context){
    return BlocProvider.of(context);
  }

  int currentIndex=0;
  void changeBottomScreen(index){
    currentIndex=index;
    emit(ChangeBottomScreen());
  }
  List<Widget>bottomScreen=const [HomeView(),CategoryView(),CartView(),ProfileView()];
}
