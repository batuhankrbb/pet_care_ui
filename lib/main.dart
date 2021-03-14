import 'package:flutter/material.dart';
import 'package:pet_care_app/screens/detail_page/detail_page.dart';
import 'package:pet_care_app/screens/home_page/home_page.dart';
import 'exports/all_files.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Cream",
          scaffoldBackgroundColor: ColorConst.backgroundWhite),
      home: DetailPage(),
    );
  }
}
