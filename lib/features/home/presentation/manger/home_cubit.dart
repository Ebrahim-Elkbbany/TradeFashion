import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/utils/api_service.dart';
import '../../data/models/product_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  ProductModel? categoryModel;
  void getProduct(){
    emit(HomeLoading());
    ApiService(Dio()).get(endPoint:'v2/list' ,queryParams: {
      'store': 'US',
      'offset': '0',
      'categoryId': '4210',
      'limit': '48',
      'country': 'US',
      'sort': 'freshness',
      'currency': 'USD',
      'sizeSchema': 'US',
      'lang': 'en-US'
    } ).then((value){
      categoryModel=ProductModel.fromJson(value);
      print(value);
      print(categoryModel!.products?[0].additionalImageUrls);
      emit(HomeSuccess(categoryModel!));
    }).catchError((error){
      print(error.toString());
      emit(HomeFailure(error));

    });
  }

}
