import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';

class DetailPage extends StatefulWidget {
  final PetFoodData petFoodData;

  DetailPage({Key key, @required this.petFoodData}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _miniImageSelectedNumber = 1;
  int _informationSelectedNumber = 0;

  List<String> titles = ["Description", "Composition", "Nutrition Facts"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 12, right: 8, bottom: 12),
        child: detailPageContent(context),
      ),
    );
  }

  Widget detailPageContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 10,
          child: leftTitleText(),
        ),
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 40,
          child: bigPhoto(),
        ),
        Spacer(
          flex: 3,
        ),
        Expanded(
          flex: 10,
          child: miniImages(),
        ),
        Spacer(
          flex: 3,
        ),
        Expanded(
          flex: 10,
          child: informationTitles(),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 15,
          child: longInformationIndexedStack(),
        ),
        Spacer(
          flex: 6,
        ),
        Expanded(
          flex: 10,
          child: purchaseRow(),
        ),
        Spacer(
          flex: 4,
        ),
      ],
    );
  }

  Widget purchaseRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: PurchaseNumberCounter(),
            flex: 10,
          ),
          Flexible(
            flex: 10,
            child: PaymentButton(
              price: widget.petFoodData.price,
            ),
          ),
        ],
      ),
    );
  }

  Widget longInformationIndexedStack() {
    return IndexedStack(
      children: [
        longInformationText(widget.petFoodData.description),
        longInformationText(
          widget.petFoodData.composition,
        ),
        longInformationText(widget.petFoodData.nutritionFacts),
      ],
      index: _informationSelectedNumber,
    );
  }

  Widget longInformationText(String text) {
    return Container(
      child: AutoSizeText(
        text,
        maxLines: 4,
        style: context.theme().textTheme.subtitle2,
      ),
    );
  }

  Widget informationTitles() {
    return Center(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return detailInformationText(index);
        },
        itemCount: 3,
      ),
    );
  }

  Widget detailInformationText(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: DetailInformationText(
        text: titles[index],
        number: index,
        selectedNumber: _informationSelectedNumber,
        onTap: () {
          setState(() {
            _informationSelectedNumber = index;
          });
        },
      ),
    );
  }

  Widget miniImages() {
    return Center(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: petFoodMiniImage(index),
          );
        },
        itemCount: 3,
      ),
    );
  }

  PetFoodMiniImage petFoodMiniImage(int index) {
    return PetFoodMiniImage(
      petFoodData: widget.petFoodData,
      number: index,
      selectedNumber: _miniImageSelectedNumber,
      onTap: () {
        setState(() {
          _miniImageSelectedNumber = index;
        });
      },
    );
  }

  Widget bigPhoto() {
    return Image.asset(
      widget.petFoodData.image,
      fit: BoxFit.fill,
      width: context.dynamicWidth(0.45),
      height: context.dynamicHeight(0.33),
    );
  } //hero eklenecek

  Widget leftTitleText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Chicken Casserole Dry Food",
        style: context
            .theme()
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        widget.petFoodData.name,
        style: TextStyle(color: ColorConst.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: NavigationItem(
        icon: IconConst.chevronLeft,
        onPressed: () {
          Navigator.pop(context);
        },
        iconSize: 30,
      ),
    );
  }
}
