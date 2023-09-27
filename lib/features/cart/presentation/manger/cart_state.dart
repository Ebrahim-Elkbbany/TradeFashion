part of 'cart_cubit.dart';
abstract class CartState {}

class CartInitial extends CartState {}

class InsertCartLoadingState extends CartInitial {}
class InsertCartSuccessState extends CartInitial {}
class InsertCartBeforeState extends CartInitial {}
class InsertCartErrorState extends CartInitial {}

class GetCartLoadingState extends CartInitial {}
class GetCartSuccessState extends CartInitial {
  final List<Map<String, Object?>> ? cartList ;

  GetCartSuccessState(this.cartList);

}
class GetCartErrorState extends CartInitial {
  final String error;

  GetCartErrorState(this.error);
}

class ChangeQuantityState extends CartInitial {}
class DeleteCartState extends CartInitial {}
