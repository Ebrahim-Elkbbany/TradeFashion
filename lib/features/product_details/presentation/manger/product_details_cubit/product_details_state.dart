part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}
class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final ProductDetailsModel productDetailsModel;

  ProductDetailsSuccess(this.productDetailsModel);
}

class ProductDetailsFailure extends ProductDetailsState {
  final String errorMessage;

  ProductDetailsFailure(this.errorMessage);
}
