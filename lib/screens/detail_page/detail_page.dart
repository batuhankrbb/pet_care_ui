import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Lily's Kitchen",
        style: TextStyle(color: ColorConst.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: NavigationItem(
        icon: IconConst.chevronLeft,
        iconSize: 30,
      ),
    );
  }
}
