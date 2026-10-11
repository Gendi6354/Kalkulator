import 'package:flutter/material.dart';

class CalculatorState {
  String mainLable = "0";
  num number1 = 0;
  num number2 = 0;
  String oper = '';

  CalculatorState({
    required this.mainLable,
    required this.number1,
    required this.number2,
    required this.oper,
  }); 

  CalculatorState copyWith({
    String? mainLable,
    num? number1,
    num? number2,
    String? oper
  }){
    return CalculatorState(
      mainLable: mainLable ?? this.mainLable,
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
      mainLable: "0",
      number1: 0,
      number2: 0,
      oper: "", ),
      );
  void handleButtonTap(String number) {

    var mainLable = value.mainLable;  
    var num1 = value.number1;
    var num2 = value.number2;
    var oper = value.oper;

    if (number == "C") {
      value = CalculatorState(
        mainLable: "0",
        number1: 0,
        number2: 0,
        oper: ""
      );
      return;
    }
    if (int.tryParse(number) == null && number != "=") {
      if(number == '.')
      {
        mainLable += number;
        value = value.copyWith(mainLable: mainLable);
        return;
      }
      if (num1 == 0) {
        num1 = num.parse(mainLable);
      } else if (num.parse(mainLable) != 0) {
        num2 = num.parse(mainLable);
        num1 = _actions(num1, num2, oper);
      }
      value = CalculatorState(
        mainLable: "0",
        number1: num1,
        number2: num2,
        oper: number); 
      return;
    }
    if (number == "=") {
      if (oper.isNotEmpty) {
        num2 = num.parse(mainLable);
        mainLable = _actions(num1, num2, oper).toString();
        value = CalculatorState(
        mainLable: mainLable,
        number1: 0,
        number2: 0,
        oper: ""); 
      }
      return;
    }

    if (int.tryParse(number) != null) {
      if (mainLable == '0') {
        mainLable = number; 
      } else {
        mainLable += number; 
      }

      value = value.copyWith(mainLable: mainLable);
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