import 'package:flutter/material.dart';
import 'package:kalkulator/models/theme_Notifier.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeColors>(
      valueListenable: themeNotifier,
      builder: (context, theme, child) {
        return Scaffold(
          backgroundColor: theme.mainColor,
          appBar: AppBar(
            backgroundColor: theme.mainColor,
            title: Text(
              'Ustawienia',
                style: TextStyle(color: theme.textColor)
              ),
            leading: IconButton(
              icon:  Icon(Icons.arrow_back, color: theme.textColor,),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Zmien motyw: ",
                          style: TextStyle(color: theme.textColor)
                        ),
                        Switch(
                          value: theme.isDark,
                          activeThumbColor: theme.primaryColor,
                          onChanged: (value) {
                            themeNotifier.changeTheme();
                          },
                        ),
                      ],
                    ),
              ],
            ),
          ),
        );
      }
    );
  }
}