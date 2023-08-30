import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/layout/manger/layout_cubit.dart';

void main() {
  runApp(const TradeFashion());
}

class TradeFashion extends StatelessWidget {
  const TradeFashion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => LayoutCubit())],
          child: MaterialApp.router(
            theme: ThemeData.light().copyWith(
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  toolbarHeight: 58,
                ),
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blueAccent,
              elevation: 20.0,
              unselectedItemColor: Colors.grey,
            ),

                textTheme: ThemeData.light().textTheme),

            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
