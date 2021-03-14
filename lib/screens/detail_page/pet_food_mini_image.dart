import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

class PetFoodMiniImage extends StatelessWidget {
  final PetFoodData petFoodData;
  final int number;
  int selectedNumber;
  VoidCallback onTap;

  PetFoodMiniImage(
      {Key key,
      @required this.petFoodData,
      @required this.number,
      @required this.selectedNumber,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.dynamicWidth(0.16),
        height: context.dynamicWidth(0.16),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: buildCenterImage(),
        ),
        decoration: buildBoxDecoration(),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: ColorConst.lightPurple,
      border: Border.all(
          color: number == selectedNumber
              ? ColorConst.darkPurple
              : Colors.transparent,
          width: 2),
    );
  }

  Center buildCenterImage() {
    return Center(
      child: Image.asset(
        petFoodData.image,
        fit: BoxFit.fill,
      ),
    );
  }
}
