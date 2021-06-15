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
  final String profileUrl =
      'https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg';

  final String profileName = " Jonathan Doe";

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ChatMessage {
  final String text;
  final bool isText;
  final String messageDate;
  final String messageTime;
  final bool isSender;

  ChatMessage({
    @required this.text,
    @required this.isText,
    @required this.messageDate,
    @required this.messageTime,
    @required this.isSender,
  });
}

List demeChatMessages = [
  ChatMessage(
    text:
        "Hey Fly 9! \n I was tossing and turning all night! I haven't slept a wink in 3 days! What's keeping you up? Nothing really.",
    isText: true,
    messageDate: 'Nov 4',
    messageTime: '18:03',
    isSender: false,
  ),
  ChatMessage(
    text:
        "Where are you going? I am going to the salon for my haircut. What hairstyle would you like?",
    isText: true,
    messageDate: 'Nov 5',
    messageTime: '10:25',
    isSender: true,
  ),
  ChatMessage(
    text: "assets/images/msg_img.png",
    isText: false,
    messageDate: 'Nov 6',
    messageTime: '13:25',
    isSender: false,
  ),
  ChatMessage(
    text: "Thanks",
    isText: true,
    messageDate: 'Nov 7',
    messageTime: '09:18',
    isSender: true,
  ),
  ChatMessage(
    text: "assets/images/msg_img.png",
    isText: false,
    messageDate: 'Nov 7',
    messageTime: '09:20',
    isSender: true,
  ),
  ChatMessage(
    text: "You are Welcome",
    isText: true,
    messageDate: 'Nov 8',
    messageTime: '11:40',
    isSender: false,
  ),
];
