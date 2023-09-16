import 'package:flutter/material.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/theme_view_body.dart';


class ThemeView extends StatelessWidget {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Theme',
        ),
        centerTitle: true,
      ),
      body: const ThemeViewBody(),
    );
  }
}
