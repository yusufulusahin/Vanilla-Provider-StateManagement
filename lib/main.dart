import 'package:flutter/material.dart';
import 'package:statemanagment_learn/future/onboard/onboard_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const OnBoardView(),
      theme: ThemeData.light().copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.amber)),
      //temayı burdan ayarlayıp yüklemeliyiz.
    );
  }
}
