import 'package:flutter/material.dart';
import 'package:circular_button_bar/home_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Circular Button Bar",
      home: HomeScreen(),
      );

  }
}