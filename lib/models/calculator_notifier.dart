import 'package:flutter/material.dart';
import 'calc_history_notifier.dart';

class CalculatorState {
  String mainlabel = "0";
  num number1 = 0;
  num number2 = 0;
  String oper = '';

  CalculatorState({
    required this.mainlabel,
    required this.number1,
    required this.number2,
    required this.oper,
  }); 

  CalculatorState copyWith({
    String? mainlabel,
    num? number1,
    num? number2,
    String? oper
  }){
    return CalculatorState(
      mainlabel: mainlabel ?? this.mainlabel,
      number1: number1 ?? this.number1,
      number2: number2 ?? this.number2,
      oper: oper ?? this.oper,
    );
  }
}

class CalculatorNotifier extends ValueNotifier<CalculatorState>
{
  CalculatorNotifier() : super(
    CalculatorState(
      mainlabel: "0",
      number1: 0,
      number2: 0,
      oper: "", ),
      );
  void handleButtonTap(String number) {

    var mainlabel = value.mainlabel;  
    var num1 = value.number1;
    var num2 = value.number2;
    var oper = value.oper;

    if (number == "C") {
      value = CalculatorState(
        mainlabel: "0",
        number1: 0,
        number2: 0,
        oper: ""
      );
      return;
    }
    if (int.tryParse(number) == null && number != "=") {
      if(number == '.')
      {
        mainlabel += number;
        value = value.copyWith(mainlabel: mainlabel);
        return;
      }
      if (num1 == 0) {
        num1 = num.parse(mainlabel);
      } else if (num.parse(mainlabel) != 0) {
        num2 = num.parse(mainlabel);
        num1 = _actions(num1, num2, oper);
      }
      value = CalculatorState(
        mainlabel: "0",
        number1: num1,
        number2: num2,
        oper: number); 
      return;
    }
    if (number == "=") {
      if (oper.isNotEmpty) {
        num2 = num.parse(mainlabel);
        mainlabel = _actions(num1, num2, oper).toString();
        value = CalculatorState(
        mainlabel: mainlabel,
        number1: 0,
        number2: 0,
        oper: ""); 
        calcHistoryNotifier.addToCalcHistory(num1, num2, oper, num.parse(mainlabel));
      }
      return;
    }

    if (int.tryParse(number) != null) {
      if(mainlabel.length <= 10)
      {
        if (mainlabel == '0') {
          mainlabel = number; 
        } else {
          mainlabel += number; 
        }
      }
      
      value = value.copyWith(mainlabel: mainlabel);
    }
  }
  num _actions(num num1, num num2, String oper) {
    switch (oper) {
      case "-":
        return num1 - num2;
      case "+":
        return num1 + num2;
      case "/":
        return num2 == 0 ? 0 : num1 / num2;
      case "*":
        return num1 * num2;
    }
    return 0;
  }   
}
final calculatorNotifier = CalculatorNotifier();