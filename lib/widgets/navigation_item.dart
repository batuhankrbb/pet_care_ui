import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

class NavigationItem extends StatelessWidget {
  final IconData icon;
  VoidCallback onPressed;
  final double iconSize;

  NavigationItem(
      {Key key, @required this.icon, @required this.iconSize, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(12),
        child: Container(
          width: context.dynamicWidth(0.085),
          height: context.dynamicWidth(0.085),
          decoration: buildBoxDecoration(),
          child: buildIcon(),
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Icon(icon, color: ColorConst.darkPurple, size: iconSize);
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: ColorConst.lightPurple,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: ColorConst.darkPurple, width: 1),
    );
  }
}
