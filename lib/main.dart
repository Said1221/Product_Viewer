import 'package:flutter/material.dart';
import 'package:product_viewer/constant/dio_helper.dart';
import 'package:product_viewer/main_screen.dart';

void main() async{
  await dioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(),
      home: main_screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

