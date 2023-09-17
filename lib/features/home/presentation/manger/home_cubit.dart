import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/utils/api_service.dart';

import '../../DD.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  CategoryModel? categoryModel;
  void getProduct(int categoryId)async{
    emit(HomeLoading());
    await ApiService(Dio()).get(endPoint:'v2/list' ,queryParams: {
    'store': 'US',
    'offset': '0',
    'categoryId': '4809',
    'limit': '48',
    'country': 'US',
    'sort': 'freshness',
    'currency': 'USD',
    'sizeSchema': 'US',
    'lang': 'en-US'
    },).then((value){
      categoryModel=CategoryModel.fromJson(value);
      emit(HomeSuccess(categoryModel!));

    }).catchError((error){
      print(error.toString());
      emit(HomeFailure(error.toString()));

    });
  }

}
