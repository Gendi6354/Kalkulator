import 'package:flutter/material.dart';
import 'package:kalkulator/models/calc_history_notifier.dart';
import 'package:kalkulator/models/theme_Notifier.dart';

class CalcHistory extends StatelessWidget {
  const CalcHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeColors>(
        valueListenable: themeNotifier,
        builder: (context, value, child) {
          return ValueListenableBuilder<List<CalcHistoryItem>>(
            valueListenable: calcHistoryNotifier,
            builder: (context, historyList, child) {
              if (historyList.isEmpty) {
                return const SizedBox.shrink();
              }
              return ListView.builder(
                itemCount: historyList.length,
                itemBuilder: (context, index) {
                  final item = historyList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 2.0),
                    child: Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 16,
                        color: value.textColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  );
                },
              );
            },
          );
        }
    );
  }
}