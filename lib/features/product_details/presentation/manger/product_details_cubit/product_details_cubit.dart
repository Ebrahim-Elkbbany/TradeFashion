import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:trade_fashion/core/utils/api_service.dart';
import 'package:trade_fashion/features/product_details/data/models/product_details_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  ProductDetailsModel? productDetailsModel;

  void getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    await ApiService(Dio()).get(
      endPoint: 'v3/detail',
      queryParams: {
        'id': '12718178',
        'lang': 'en-US',
        'store': 'US',
        'sizeSchema': 'US',
        'currency': 'USD'
      },
    ).then((value) {
      productDetailsModel = ProductDetailsModel.fromJson(value);
      print(productDetailsModel?.media!.images?[0]);
      emit(ProductDetailsSuccess(productDetailsModel!));
    });
  }
}
