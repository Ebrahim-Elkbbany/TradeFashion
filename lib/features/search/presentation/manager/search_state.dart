part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}
class SearchSuccess extends SearchState {
  final ProductModel productModel;
  SearchSuccess(this.productModel);

}
class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure(this.errorMessage);
}
