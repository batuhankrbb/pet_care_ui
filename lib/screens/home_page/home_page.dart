import 'package:flutter/material.dart';
import 'package:pet_care_app/exports/all_files.dart';
import 'package:pet_care_app/screens/detail_page/detail_page.dart';
import 'package:pet_care_app/screens/home_page/pet_chip.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 12, top: 8, right: 12),
        child: buildHomePageContent(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Foods",
        style: TextStyle(color: ColorConst.black, fontWeight: FontWeight.bold),
      ),
      leading: NavigationItem(
        icon: IconConst.chevronLeft,
        iconSize: 30,
      ),
      actions: [
        NavigationItem(
          icon: IconConst.shoppingIcon,
          iconSize: 22,
        ),
      ],
    );
  }

  Widget buildHomePageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 10,
          child: SearchBar(
            hintText: "Search Foods...",
            icon: IconConst.searchIcon,
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 10,
          child: buildPetChipListView(),
        ),
        Spacer(
          flex: 5,
        ),
        Expanded(
          flex: 80,
          child: buildPetFoodGridView(),
        ),
      ],
    );
  }

  Widget buildPetFoodGridView() {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return PetFoodBox(
          petFoodData: petFoodList[index],
          onTap: () {
            navigateToDetail(context, index);
          },
        );
      },
      itemCount: petFoodList.length,
    );
  }

  Widget buildPetChipListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (contex, index) {
        return petChip(index);
      },
      itemCount: petDataList.length,
    );
  }

  PetChip petChip(int index) {
    return PetChip(
      petData: petDataList[index],
      number: index,
      selectedNumber: selectedNumber,
      onTap: () {
        setState(() {
          selectedNumber = index;
        });
      },
    );
  }

  void navigateToDetail(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailPage(petFoodData: petFoodList[index]);
        },
      ),
    );
  }
}
