import 'package:flutter/material.dart';

import 'package:pet_care_app/exports/all_files.dart';

class DetailButton extends StatelessWidget {
  final IconData icon;
  VoidCallback onPressed;
  final double iconSize;

  DetailButton(
      {Key key, @required this.icon, @required this.iconSize, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Container(
          width: context.dynamicWidth(0.075),
          height: context.dynamicWidth(0.075),
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
    );
  }
}
