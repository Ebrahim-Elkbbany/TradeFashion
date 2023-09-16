import 'package:flutter/material.dart';
import 'package:trade_fashion/core/widgets/custom_radio_list_tile.dart';

class LanguageViewBody extends StatefulWidget {
  const LanguageViewBody({Key? key}) : super(key: key);

  @override
  State<LanguageViewBody> createState() => _LanguageViewBodyState();
}

class _LanguageViewBodyState extends State<LanguageViewBody> {
  Object? selectLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          customRadioListTile(
            value: 'English',
            groupValue: selectLanguage,
            title: 'English',
            onChanged: (value) {
              setState(() {
                selectLanguage = value;
              });
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness:0.5,
          ),
          customRadioListTile(
            value: 'Arabic',
            groupValue: selectLanguage,
            title: 'Arabic',
            onChanged: (value) {
              setState(() {
                selectLanguage = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
