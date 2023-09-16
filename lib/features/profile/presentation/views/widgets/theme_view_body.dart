import 'package:flutter/material.dart';
import 'package:trade_fashion/core/widgets/custom_radio_list_tile.dart';

class ThemeViewBody extends StatefulWidget {
  const ThemeViewBody({Key? key}) : super(key: key);

  @override
  State<ThemeViewBody> createState() => _ThemeViewBodyState();
}

class _ThemeViewBodyState extends State<ThemeViewBody> {
  Object? selectTheme ='Light Mode';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          customRadioListTile(
            value: 'Light Mode',
            groupValue: selectTheme,
            title: 'Light Mode',
            onChanged: (value) {
              setState(() {
                selectTheme = value;
              });
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
           thickness:0.5,
          ),
          customRadioListTile(
            value: 'Dark Mode',
            groupValue: selectTheme,
            title: 'Dark Mode',
            onChanged: (value) {
              setState(() {
                selectTheme = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
