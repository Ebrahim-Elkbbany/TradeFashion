import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../constants.dart';
import '../../../auth/data/model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  List<Map<String, Object?>>? cartList;
  List<int> totalPrice=[];

  Future<void> getCart() async {
    emit(GetCartLoadingState());
    final db = await DatabaseHelper().db;
    await db!.query(
      'cart',
      where: 'email = ?',
      whereArgs: [token],
    ).then((value) {
      cartList=value;
      emit(GetCartSuccessState(value));
    }).catchError((e) {
      print(e.toString());
      emit(GetCartErrorState(e.toString()));
    });
  }

  void insertToCart({
    required String productName,
    required String productId,
    required String price,
    required int quantity,
    required String image,
    required String color,
    required String size,
  }) async {
    emit(InsertCartLoadingState());
    final db = await DatabaseHelper().db;
    final existingItems = await db?.query(
      'cart',
      where: 'productId = ? AND email = ?',
      whereArgs: [productId, token],
    );
    if (existingItems!.isEmpty) {
      await db?.insert('cart', {
        "productName": productName,
        "productId":productId,
        'Quantity':quantity,
        "price": price,
        "email": token,
        "image": image,
        "color": color,
        "size": size,
      }).then((value) {
        print(value);
        emit(InsertCartSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(InsertCartErrorState());
      });
    } else {
      // showToast(message: 'هذا العنصر مضاف من قبل', state: ToastStates.warning);
      emit(InsertCartBeforeState());
    }
  }


  void changeQuantity(int index, productId,int indexItem) async {
    Database? myDb = await DatabaseHelper().db;
    await myDb?.update(
      'cart',
      {'quantity': index},
      where: 'productId = ? AND email = ?',
      whereArgs: [productId, token],
    );
    getCart();
    emit(ChangeQuantityState());
  }
  void deleteCartItem({required String productId, required int indexItem})async{
    Database? myDb = await DatabaseHelper().db;
    await myDb?.delete(
    'cart',
    where: 'productId = ? AND email = ?',
    whereArgs: [productId, token],
    );
    getCart();
    emit(DeleteCartState());
  }
}
