import 'package:flutter/material.dart';
import 'package:trade_fashion/core/utils/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/theme.dart';
import 'features/layout/manger/layout_cubit.dart';

void main() {
  runApp(const TradeFashion());
}

class TradeFashion extends StatelessWidget {
  const TradeFashion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LayoutCubit())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
