import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trade_fashion/core/widgets/custom_radio_list_tile.dart';


class ThemeView extends StatefulWidget {
  const ThemeView({Key? key}) : super(key: key);

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {
  Object selectTheme ='Light Mode';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectTheme == 'Light Mode' ? Colors.white : Colors.grey[900] ,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:selectTheme == 'Light Mode' ?  Colors.white : Colors.grey[900] ,
          statusBarIconBrightness: selectTheme == 'Light Mode' ? Brightness.dark : Brightness.light ,
        ),
        backgroundColor:selectTheme == 'Light Mode' ? Colors.white :  Colors.grey[900],
        iconTheme:  IconThemeData(color: selectTheme == 'Light Mode' ?  Colors.black :  Colors.white),
        title:  Text(
          'Theme',
          style: TextStyle(color: selectTheme == 'Light Mode' ?  Colors.black :  Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            customRadioListTile(
              value: 'Light Mode',
              groupValue: selectTheme,
              title: 'Light Mode',
              onChanged: (value) {
                setState(
                      () {
                    selectTheme = value;
                  },
                );
              },  color: selectTheme == 'Dark Mode' ? Colors.white :  Colors.black,

            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 0.5,
            ),
            customRadioListTile(
              value: 'Dark Mode',
              groupValue: selectTheme,
              title: 'Dark Mode',
              onChanged: (value) {
                setState(() {
                  selectTheme = value;
                });
              }, color:selectTheme == 'Dark Mode' ? Colors.white :  Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
