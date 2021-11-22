import 'package:flutter/material.dart';
import '../views/list_page.dart';
import '../constants/constants.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies App",
      theme: ThemeData(
        primarySwatch: Constants.primaryColor,
        primaryColor: Constants.primaryColor,
        scaffoldBackgroundColor: Constants.backgroundColor,
        fontFamily: Constants.defaultFont,
      ),
      color: Colors.white,
      home: const ListPage(),
    );
  }
}