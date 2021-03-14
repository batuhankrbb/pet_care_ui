import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

class PaymentButton extends StatelessWidget {
  final int price;

  const PaymentButton({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      width: context.dynamicWidth(0.35),
      height: context.dynamicHeight(0.08),
      child: Padding(
        padding: EdgeInsets.only(left: 6, top: 4, bottom: 4, right: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(
              flex: 2,
            ),
            Flexible(
              flex: 30,
              child: priceText(context),
            ),
            Spacer(
              flex: 14,
            ),
            Flexible(
              flex: 30,
              child: buildPaymentIconButton(),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  PaymentIconButton buildPaymentIconButton() =>
      PaymentIconButton(icon: IconConst.chevronRight, iconSize: 25);

  Text priceText(BuildContext context) {
    return Text(
      "\$$price",
      style: context
          .theme()
          .textTheme
          .headline6
          .copyWith(color: ColorConst.white, fontWeight: FontWeight.bold),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      gradient: buildLinearGradient(),
      borderRadius: BorderRadius.circular(12),
    );
  }

  LinearGradient buildLinearGradient() {
    return LinearGradient(
      colors: [
        ColorConst.darkPurple,
        ColorConst.darkPurple.withOpacity(0.5),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
  }
}
