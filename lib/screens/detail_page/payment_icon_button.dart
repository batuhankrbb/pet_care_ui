import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

class PaymentIconButton extends StatelessWidget {
  final IconData icon;
  VoidCallback onPressed;
  final double iconSize;

  PaymentIconButton(
      {Key key, @required this.icon, @required this.iconSize, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Container(
          width: context.dynamicWidth(0.060),
          height: context.dynamicWidth(0.060),
          decoration: buildBoxDecoration(),
          child: buildIcon(),
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Icon(icon, color: ColorConst.white, size: iconSize);
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: ColorConst.lightPurple.withOpacity(0.4),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
