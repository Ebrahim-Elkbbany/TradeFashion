import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/utils/styles.dart';
import 'package:trade_fashion/features/home/presentation/manger/home_cubit.dart';
import 'app_bloc_observer.dart';
import 'core/utils/theme.dart';
import 'features/layout/manger/layout_cubit.dart';
import 'features/product_details/presentation/manger/product_details_cubit/product_details_cubit.dart';

void main() {
  runApp(const TradeFashion());
  Bloc.observer = AppBlocObserver();
}

class TradeFashion extends StatelessWidget {
  const TradeFashion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => HomeCubit()..getProduct()),
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
            statusBarIconBrightness: Brightness.dark
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )),
        routerConfig: AppRouter.router ,
      ),
    );
  }
}
