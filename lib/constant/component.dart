import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// navigation between screens
void navigateTo(context , widget) => Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context) => widget
  ),
);
