import 'package:flutter/material.dart';
import 'package:kalkulator/models/calculator_notifier.dart';
import 'package:kalkulator/models/theme_Notifier.dart';

class CalcLable extends StatelessWidget {
  const CalcLable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
        child: 
        ValueListenableBuilder<ThemeColors>(
          valueListenable: themeNotifier,
          builder: (context, theme, child) {
            return ValueListenableBuilder<CalculatorState>(
              valueListenable: calculatorNotifier,
              builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end, 
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      children:[ Text(
                        textAlign: TextAlign.right,
                        value.oper,
                        style: TextStyle(fontSize: 40,color: theme.textColor),),
                      ] 
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text(
                        textAlign: TextAlign.right,
                        value.mainLable,
                        style: TextStyle(fontSize: 60,color: theme.textColor),),
                  ])
                  ],
                );
              }
            );
          }
        ),
    );
  }
}