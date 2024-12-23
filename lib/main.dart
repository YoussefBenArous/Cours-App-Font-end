import 'package:cours_app/Screens/Home_Screen.dart';
import 'package:cours_app/Screens/account.dart';
import 'package:cours_app/home/FirstPage.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(
     MyApp(),
    
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cours App',
      debugShowCheckedModeBanner: false,
      home: Account(),
    );
  }
}