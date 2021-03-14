import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

class PetChip extends StatelessWidget {
  final PetData petData;
  int number;
  int selectedNumber;
  VoidCallback onTap;

  PetChip(
      {Key key,
      @required this.petData,
      @required this.number,
      @required this.selectedNumber,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        constraints: BoxConstraints(maxWidth: context.dynamicWidth(1)),
        decoration: chipBoxDecoration(),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: buildItems(context),
        ),
      ),
    );
  }

  BoxDecoration chipBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(32),
      color: ColorConst.lightGray,
    );
  }

  Widget buildItems(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 50,
          child: petImageWithBackground(context),
        ),
        Spacer(
          flex: 2,
        ),
        Flexible(
          flex: 50,
          child: Text(
            petData.name,
            style: context.theme().textTheme.subtitle1.copyWith(
                color: selectedNumber == number
                    ? ColorConst.darkPurple
                    : ColorConst.black),
          ),
        )
      ],
    );
  }

  Widget petImageWithBackground(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageBackground(context),
        Padding(
          padding: EdgeInsets.all(4),
          child: imagePhoto(context),
        ),
      ],
    );
  }

  Widget imagePhoto(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(petData.image),
          fit: BoxFit.fill,
        ),
      ),
      width: context.dynamicWidth(0.07),
    );
  }

  Widget imageBackground(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selectedNumber == number
            ? ColorConst.darkPurple
            : Colors.transparent,
      ),
      width: context.dynamicWidth(0.07),
    );
  }
}

/*
Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            color: Colors.red,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Text("Merhabaaaaaaaa")),
                Expanded(child: Text("TEST"))
              ],
            ),
          ),
        )
 */
