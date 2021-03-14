import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

class DetailInformationText extends StatelessWidget {
  final String text;
  final int number;
  int selectedNumber;
  VoidCallback onTap;

  DetailInformationText(
      {Key key,
      @required this.text,
      @required this.number,
      @required this.selectedNumber,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InfoText(context),
          miniCircle(),
        ],
      ),
    );
  }

  Widget InfoText(BuildContext context) {
    return FittedBox(
      child: Text(
        text,
        style: context.theme().textTheme.subtitle1.copyWith(
            fontSize: 18,
            color: number == selectedNumber
                ? ColorConst.darkPurple
                : ColorConst.black),
      ),
    );
  }

  CircleAvatar miniCircle() {
    return CircleAvatar(
      radius: 4,
      backgroundColor:
          number == selectedNumber ? ColorConst.darkPurple : Colors.transparent,
    );
  }
}
