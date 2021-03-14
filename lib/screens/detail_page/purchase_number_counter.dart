import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

class PurchaseNumberCounter extends StatefulWidget {
  @override
  _PurchaseNumberCounterState createState() => _PurchaseNumberCounterState();
}

class _PurchaseNumberCounterState extends State<PurchaseNumberCounter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: decreaseButton(),
          flex: 10,
        ),
        Spacer(),
        Flexible(
          flex: 10,
          child: counterText(context),
        ),
        Spacer(),
        Flexible(
          flex: 10,
          child: increaseButton(),
        ),
      ],
    );
  }

  Text counterText(BuildContext context) {
    return Text(
      "$_counter",
      style: context
          .theme()
          .textTheme
          .subtitle1
          .copyWith(fontWeight: FontWeight.bold),
    );
  }

  MiniMathButton decreaseButton() {
    return MiniMathButton(
      icon: IconConst.remove,
      iconSize: 20,
      backgroundColor: ColorConst.darkGray,
      onTap: () {
        setState(() {
          _counter -= 1;
        });
      },
    );
  }

  MiniMathButton increaseButton() {
    return MiniMathButton(
        icon: IconConst.add,
        iconSize: 20,
        onTap: () {
          setState(() {
            _counter += 1;
          });
        },
        backgroundColor: ColorConst.darkPurple);
  }
}
