part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {
  final CategoryModel categoryModel;

  HomeSuccess(this.categoryModel);

}
class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure(this.errorMessage);
}
