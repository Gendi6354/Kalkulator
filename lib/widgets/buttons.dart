import 'package:flutter/material.dart';
import "package:kalkulator/models/calculator_notifier.dart";
import 'package:kalkulator/models/theme_Notifier.dart';


class Buttons extends StatelessWidget {
Buttons({ Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context){
     final List<String> listOfButtons = [
      '7', '8', '9', 'C',
      '4', '5', '6', '+',
      '1', '2', '3', '-',
      '0','*', '/', '='
    ];
    return 
    ValueListenableBuilder<ThemeColors>(
      valueListenable: themeNotifier,
      builder: (context, value, child) {
        return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 4 przyciski w każdym rzędzie
                    crossAxisSpacing: 8, // odstęp w poziomie
                    mainAxisSpacing: 8,  // odstęp w pionie
                  ),
                  itemCount: listOfButtons.length,    
                  itemBuilder: (context, index)
                  { 
                    return 
                    FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: value.primaryColor
                    ),
                    onPressed: ()=> calculatorNotifier.handleButtonTap(listOfButtons[index]),
                    child: Text(listOfButtons[index],
                    style: TextStyle(fontSize: 20,color: value.textColor),),
                    );
                  },
        );
      }
    );
  }
}