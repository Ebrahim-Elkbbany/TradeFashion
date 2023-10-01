import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/features/auth/data/model.dart';
part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  static FavouritesCubit get(context) {
    return BlocProvider.of(context);
  }

  FavouritesCubit() : super(FavouritesInitial());

   List<Map<String, Object?>>?  favouritesList ;
  List<String>  favouritesId =[];
  Future<void> getFavourite() async {
    emit(GetFavouritesLoadingState());
    final db = await DatabaseHelper().db;
   await db!.query(
      'favourite',
      where: 'email = ?',
      whereArgs: [tokenEmail],
    ).then((value) {
      favouritesList=value;
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
        required String image1,
        required String image2,
        required String image3,
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
        "isFavorite":'true',
        "image1": image1,
        "image2": image2,
        "image3": image3,
      }).
      then((value) {
        favouritesId.add(productId);
        getFavourite();
        emit(InsertFavouritesSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(InsertFavouritesErrorState());
      });
    } else {
      deleteFavourite(productId:productId);
    }
  }

  void updateFavorite( productId,String isFavorite) async {
    Database? myDb = await DatabaseHelper().db;

    await myDb?.update(
      'favourite',
      {'isFavorite': isFavorite},
      where: 'productId = ? AND email = ?',
      whereArgs: [productId, tokenEmail],
    );
    getFavourite();
    emit(UpdateFavoriteState());
  }

  void deleteFavourite({ required String productId,})async{
    Database? myDb = await DatabaseHelper().db;
    updateFavorite(productId,'false');
    await myDb?.delete(
      'favourite',
      where: 'productId = ? AND email = ?',
      whereArgs: [productId, tokenEmail],
    ).then((value) {
      favouritesId.remove(productId);
      emit(InsertFavouritesSuccessState());
    }).catchError((e) {
      emit(InsertFavouritesErrorState());
    });
  }
}
