import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/api_service.dart';
import '../../../home/data/models/product_model.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context){
    return BlocProvider.of(context);
  }

  ProductModel? searchProductModel;

  void getSearch(
      dynamic text,
      )async{
    emit(SearchLoading());
    await ApiService(Dio()).get(endPoint:'v2/list' ,queryParams: {
      'store': 'US',
      'offset': '0',
      'categoryId':'',
      'limit': '100',
      'country': 'US',
      'sort': 'freshness',
      'q': text,
      'currency':'USD',
      'sizeSchema': 'US',
      'lang': 'en-US',
    },).then((value){
      searchProductModel=ProductModel.fromJson(value);
      print(searchProductModel.toString());
      emit(SearchSuccess(searchProductModel!));

    }).catchError((error){
      print(error.toString());
      emit(SearchFailure(error.toString()));
    });
  }

}
