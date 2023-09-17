part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {
  final ProductModel productModel;

  HomeSuccess(this.productModel);



}
class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure(this.errorMessage);
}
