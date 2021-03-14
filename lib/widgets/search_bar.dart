import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

//I know that I should add it some functionality but all I care is the UI Design so I don't try to add some functionality because it isn't a real app.
class SearchBar extends StatelessWidget {
  final String hintText;
  final IconData icon;
  SearchBar({Key key, @required this.hintText, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.dynamicWidth(0.85),
        height: context.dynamicHeight(0.07),
        decoration: buildBoxDecoration(),
        child: Align(
          alignment: Alignment.centerLeft,
          child: textFieldWithPadding(),
        ),
      ),
    );
  }

  Padding textFieldWithPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        decoration: textFieldDecoration(),
      ),
    );
  }

  InputDecoration textFieldDecoration() {
    return InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(color: ColorConst.darkGray),
        suffixIcon: Icon(
          icon,
          color: ColorConst.darkGray,
        ));
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: ColorConst.white);
  }
}
