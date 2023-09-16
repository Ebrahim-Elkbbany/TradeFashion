import 'package:flutter/material.dart';
import 'package:trade_fashion/features/profile/presentation/views/widgets/language_view_body.dart';


class LanguageView extends StatelessWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Language',
        ),
        centerTitle: true,
      ),
      body: const LanguageViewBody(),
    );
  }
}
