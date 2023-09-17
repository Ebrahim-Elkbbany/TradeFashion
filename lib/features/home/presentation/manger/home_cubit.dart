import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/utils/api_service.dart';

import '../../data/models/product_model.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  ProductModel? productModel;
  void getProduct({int? categoryId})async{
    emit(HomeLoading());
    await ApiService(Dio()).get(endPoint:'v2/list' ,queryParams: {
    'store': 'US',
    'offset': '0',
    'categoryId': '4208',
    'limit': '48',
    'country': 'US',
    'sort': 'freshness',
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
