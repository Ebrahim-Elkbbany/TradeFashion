import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/features/auth/data/model.dart';
import 'package:trade_fashion/features/auth/presentation/manger/auth_cubit.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  static FavouritesCubit get(context) {
    return BlocProvider.of(context);
  }
  FavouritesCubit() : super(FavouritesInitial());

  List<String> favoriteItems = [];

  Future<void> getFavourite() async {
    emit(GetFavouritesLoadingState());
    final db = await DatabaseHelper().db;
    await db!.query(
      'favourite',
      where: 'email = ?',
      whereArgs: [tokenEmail],
    ).then((value) {
      emit(GetFavouritesSuccessState(value));
    }
    ).catchError((e){
      print(e);
      emit(GetFavouritesErrorState(e.toString()));
    });
  }

  void insertFavourite(
      {required String productName,
        required String price,
        required String image,
        required String productId,
      }) async {
    emit(InsertFavouritesLoadingState());
    Database? myDb = await DatabaseHelper().db;
    final existingItems = await myDb?.query(
      'favourite',
      where: 'productId = ? AND email = ?',
      whereArgs: [productId, tokenEmail],
    );
    if (existingItems!.isEmpty) {
      await myDb?.insert('favourite', {
        "productName": productName,
        "productId": productId,
        "price": price,
        "email": tokenEmail,
        "image": image,
      }).then((value) {
        print(value);
        favoriteItems.add(productId);

        emit(InsertFavouritesSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(InsertFavouritesErrorState());
      });
    } else {
      await myDb?.delete(
        'favourite',
        where: 'productId = ? AND email = ?',
        whereArgs: [productId, tokenEmail],
      ).then((value) {
        print(value);
        favoriteItems.remove(productId);
        emit(InsertFavouritesSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(InsertFavouritesErrorState());
      });
    }
  }
}
