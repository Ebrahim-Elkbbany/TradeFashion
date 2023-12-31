import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:trade_fashion/constants.dart';

import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/utils/shared_prefrence.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/features/auth/presentation/manger/auth_cubit.dart';
import 'package:trade_fashion/features/cart/presentation/manger/cart_cubit.dart';
import 'package:trade_fashion/features/favourites/presentation/manger/favourites_cubit/favourites_cubit.dart';
import 'package:trade_fashion/features/home/presentation/manger/home_cubit.dart';
import 'app_bloc_observer.dart';
import 'core/utils/theme.dart';
import 'features/category/presentation/manger/category_product_cubit/category_product_cubit.dart';
import 'features/layout/manger/layout_cubit.dart';
import 'features/product_details/presentation/manger/product_details_cubit/product_details_cubit.dart';

void main() async{

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await SharedPreference.init();
   token = SharedPreference.getData(key: 'tokenEmail');
  runApp( const TradeFashion());

}

class TradeFashion extends StatelessWidget {
  const TradeFashion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => CategoryProductCubit()),
        BlocProvider(create:(context) => FavouritesCubit()),
        BlocProvider(create: (context) => HomeCubit()..getHomeProduct()),
        BlocProvider(create: (context) => ProductDetailsCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: lightTheme.copyWith(
            appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
