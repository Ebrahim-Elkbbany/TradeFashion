part of 'category_product_cubit.dart';


abstract class CategoryProductState {}

class CategoryProductInitial extends CategoryProductState {}
class CategoryProductLoading extends CategoryProductState {}
class CategoryProductSuccess extends CategoryProductState {
  final ProductModel categoryProductModel;
  CategoryProductSuccess(this.categoryProductModel);

}
class CategoryProductFailure extends CategoryProductState {
  final String errorMessage;

  CategoryProductFailure(this.errorMessage);
}