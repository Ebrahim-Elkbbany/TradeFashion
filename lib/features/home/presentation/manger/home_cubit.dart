import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/utils/api_service.dart';

import '../../data/models/product_model.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context){
    return BlocProvider.of(context);
  }
  int currentIndex=4209;
  ProductModel? productModel;
  void getHomeProduct()async{
    emit(HomeLoading());
    await ApiService(Dio()).get(endPoint:'v2/list' ,queryParams: {
    'store': 'US',
    'offset': '0',
    'categoryId': '',
    'limit': '100',
    'country': 'US',
    'sort': 'freshness',
    'q': 'Men\'s',
    'currency': 'USD',
    'sizeSchema': 'US',
    'lang': 'en-US'
    },).then((value){
      productModel=ProductModel.fromJson(value);
      print(productModel!.products?[0].price?.current?.text);
      emit(HomeSuccess(productModel!));

    }).catchError((error){
      print(error.toString());
      emit(HomeFailure(error.toString()));

    });
  }

}
