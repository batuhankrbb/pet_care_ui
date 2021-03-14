import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

class MiniMathButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color backgroundColor;
  VoidCallback onTap;

  MiniMathButton(
      {Key key,
      @required this.icon,
      @required this.iconSize,
      @required this.backgroundColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: buildBoxDecoration(),
        width: context.dynamicWidth(0.07),
        height: context.dynamicWidth(0.07),
        child: buildIcon(),
      ),
    );
  }

  Icon buildIcon() {
    return Icon(
      icon,
      size: iconSize,
      color: ColorConst.white,
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: backgroundColor, borderRadius: BorderRadius.circular(6));
  }
}
