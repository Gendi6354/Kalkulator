import 'package:flutter/material.dart';
import 'package:kalkulator/models/theme_Notifier.dart';
import 'package:kalkulator/view/settings.dart';
import 'package:kalkulator/widgets/buttons.dart';
import 'package:kalkulator/widgets/calc_Label.dart';
import 'package:kalkulator/widgets/calc_history.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeColors>(
      valueListenable: themeNotifier,
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: value.mainColor,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, 
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: value.primaryColor.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: value.textColor,
                            size: 26,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => Settings(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: ScaleTransition(
                                      scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                                        CurvedAnimation(parent: animation, curve: Curves.easeOut),
                                      ),
                                      child: child,
                                    ),
                                  );
                                },
                                transitionDuration: const Duration(milliseconds: 250),
                              ),
                            );
                          },
                          tooltip: 'Ustawienia',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CalcHistory(),
                ),
                Expanded(
                  flex: 5,
                  child: CalcLabel(),
                ),
                Expanded(
                  flex: 10,
                  child: Buttons(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}