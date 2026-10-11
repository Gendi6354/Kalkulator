// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CalcHistoryItem {
  final num num1;
  final num num2;
  final num result;
  final String oper;
  final String label;
  
  CalcHistoryItem({
    required this.num1,
    required this.num2,
    required this.oper,
    required this.label,
    required this.result
  });

  CalcHistoryItem copyWith({
    num? num1,
    num? num2,
    num? result,
    String? oper,
    String? label,
  }) {
    return CalcHistoryItem(
      num1: num1 ?? this.num1,
      num2: num2 ?? this.num2,
      result: result ?? this.result,
      oper: oper ?? this.oper,
      label: label ?? this.label, 
    );
  }
}

class CalcHistoryNotifier extends ValueNotifier<List<CalcHistoryItem>>
{
  CalcHistoryNotifier() : super([]);

  void addToCalcHistory(num num1, num num2, String oper,num result)
  {
    final hisotryItem = CalcHistoryItem(
      num1: num1,
      num2: num2,
      result: result,
      oper: oper,
      label: num1.toString()+ " " + oper + " " + num2.toString() + " = " + result.toString()
    );

    final updatedCalcHistory = [...value, hisotryItem];

    if (updatedCalcHistory.length > 5) {
      value = updatedCalcHistory.skip(1).toList();
    } else {
      value = updatedCalcHistory;
    }
  }
}

final calcHistoryNotifier = CalcHistoryNotifier();
