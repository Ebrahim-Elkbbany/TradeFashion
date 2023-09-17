import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:trade_fashion/core/utils/api_service.dart';
import 'package:trade_fashion/features/home/data/models/product_details_model.dart';

import '../../DD.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  ProductDetailsModel? productDetailsModel;
  void getCategory(){
    emit(HomeLoading());
    ApiService(Dio()).get(endPoint:'v3/detail' ,queryParams: {
      'id': '203830320',
      'lang': 'en-US',
      'store': 'US',
      'sizeSchema': 'US',
      'currency': 'USD'
    } ).then((value){
      productDetailsModel=ProductDetailsModel.fromJson(value);
      print(productDetailsModel!.media!.images?[0].url);


      emit(HomeSuccess());
    }).catchError((error){
      print(error.toString());
      emit(HomeFailure());

    });
  }

}
