import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:trade_fashion/core/utils/api_service.dart';
import 'package:trade_fashion/features/home/data/models/product_model.dart';

part 'category_product_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  CategoryProductCubit() : super(CategoryProductInitial());
  static CategoryProductCubit get(context){
    return BlocProvider.of(context);
  }
  ProductModel? categoryProductModel;
   getCategoryProduct({int? categoryId})async{
    emit(CategoryProductLoading());
    await ApiService(Dio()).get(endPoint:'v2/list' ,queryParams: {
      'store': 'US',
      'offset': '0',
      'categoryId': '$categoryId',
      'limit': '48',
      'country': 'US',
      'sort': 'freshness',
      'currency': 'USD',
      'sizeSchema': 'US',
      'lang': 'en-US'
    },).then((value){
      categoryProductModel=ProductModel.fromJson(value);
      print(categoryProductModel!.products?[0].price?.current?.text);
      emit(CategoryProductSuccess(categoryProductModel!));
    }).catchError((error){
      print(error.toString());
      emit(CategoryProductFailure(error.toString()));
    });
  }
}
