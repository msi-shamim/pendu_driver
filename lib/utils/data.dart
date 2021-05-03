import 'package:flutter/material.dart';

List<String> itemList = [
  '2 x toothpaste',
  '3 x banana',
  '1 x soap',
  '2 x Chicken 1.5 kg'
];

class ProfileInfoModel {
  final String name, imgUrl, location, phone, dob, vehicleType, category;
  ProfileInfoModel(
      {this.name,
      this.imgUrl,
      this.location,
      this.phone,
      this.dob,
      this.vehicleType,
      this.category});
}

List<ProfileInfoModel> profileInfoList = [
  ProfileInfoModel(
      name: 'Jonathan Doe',
      imgUrl:
          'https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg',
      location: '3/A Jadobpur, Abdul Goli, MD Pur, Dhaka',
      phone: '+663 2523 2523',
      dob: '17th December 1999',
      vehicleType: 'Car',
      category: 'Shop & Drop, Collect & drop')
];

class AllDAata extends StatelessWidget {
  String profileUrl =
      'https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg';

  String profileName = " Jonathan Doe";

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
