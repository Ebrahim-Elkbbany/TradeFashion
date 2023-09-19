part of 'product_details_cubit.dart';

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
class ChangeImageState extends ProductDetailsState {}
class ChangeSelectedState extends ProductDetailsState {}
