import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class ProfileInfoPage extends StatefulWidget {
  @override
  _ProfileInfoPageState createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  Widget _buildInfoList({String iconUrl, String topic}) {
    return SizedBox(
      height: 35.0,
      child: Row(
        children: [
          SvgPicture.asset(
            iconUrl,
            color: Pendu.color('90A0B2'),
            height: 20.0,
            width: 20.0,
          ),
          SizedBox(width: 10.0),
          Text(topic)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBarUtils(appBarTitle: 'Profile Info'),
        ),
        body: SingleChildScrollView(
          child: Container(
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 44,
                      backgroundColor: Pendu.color('5BDB98'),
                      child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(profileInfoList[0].imgUrl)),
                    ),
                    Text(
                      profileInfoList[0].name,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      child: Column(
                        children: [
                          _buildInfoList(
                              topic: profileInfoList[0].location,
                              iconUrl: 'assets/svg_icon/location.svg'),
                          _buildInfoList(
                              topic: profileInfoList[0].phone,
                              iconUrl: 'assets/svg_icon/phone.svg'),
                          _buildInfoList(
                              topic: profileInfoList[0].dob,
                              iconUrl: 'assets/svg_icon/calender.svg'),
                          _buildInfoList(
                              topic: profileInfoList[0].vehicleType,
                              iconUrl: 'assets/svg_icon/car.svg'),
                          _buildInfoList(
                              topic: profileInfoList[0].category,
                              iconUrl: 'assets/svg_icon/category2.svg'),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
