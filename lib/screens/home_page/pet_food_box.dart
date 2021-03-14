import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

class PetFoodBox extends StatelessWidget {
  final PetFoodData petFoodData;
  VoidCallback onTap;

  PetFoodBox({Key key, @required this.petFoodData, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: buildPetFoodBoxDecoration(),
        width: context.dynamicWidth(0.42),
        height: context.dynamicHeight(0.43),
        child: buildPetFoodBoxContent(context),
      ),
    );
  }

  Widget buildPetFoodBoxContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 70,
            child: foodImageWithBackground(context),
          ),
          Spacer(
            flex: 4,
          ),
          Expanded(
            flex: 30,
            child: bottomWidgets(context),
          ),
        ],
      ),
    );
  }

  Widget foodImageWithBackground(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        foodImageBackground(context),
        foodImage(context),
      ],
    );
  }

  Widget foodImage(BuildContext context) {
    return Container(
      child: Image.asset(
        petFoodData.image,
        width: context.dynamicWidth(0.35),
        height: context.dynamicHeight(0.30),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget foodImageBackground(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.35),
      height: context.dynamicHeight(0.15),
      decoration: BoxDecoration(
        color: ColorConst.lightGray,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget bottomWidgets(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: informationText(context),
          flex: 50,
        ),
        Spacer(
          flex: 6,
        ),
        Flexible(
          flex: 30,
          child: DetailButton(
            icon: IconConst.chevronRight,
            iconSize: 30,
          ),
        ),
      ],
    );
  }

  Widget informationText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Text(
            petFoodData.name,
            style: context
                .theme()
                .textTheme
                .subtitle2
                .copyWith(fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
        ),
        FittedBox(
          child: Text(
            "\$${petFoodData.price}",
            style: context
                .theme()
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  BoxDecoration buildPetFoodBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    );
  }
}
