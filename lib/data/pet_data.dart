import 'package:flutter/foundation.dart';

//hen fish dog cow
class PetData {
  String image;
  String name;

  PetData({@required this.name, @required this.image});
}

List<PetData> petDataList = [chicken, fish, dog, cow];

PetData chicken =
    PetData(name: "Chicken", image: "assets/petPhotos/photo1_pet.png");

PetData fish = PetData(name: "Fish", image: "assets/petPhotos/photo2_pet.png");

PetData dog = PetData(name: "Dog", image: "assets/petPhotos/photo3_pet.png");

PetData cow = PetData(name: "Cow", image: "assets/petPhotos/photo4_pet.png");
