import 'package:flutter/material.dart';
import 'package:product_viewer/dio_helper.dart';
import 'package:product_viewer/main_screen.dart';

void main() async{

  await dioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: main_screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

