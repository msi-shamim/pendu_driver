import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/utils/utils.dart';

class DriverRatingsModel {
  final String title, imgUrl, subLine1, subLine2, subLine3, subLine4;
  final double commissionRate;
  final bool isActive;
  DriverRatingsModel(
      {this.title,
      this.imgUrl,
      this.subLine1,
      this.subLine2,
      this.subLine3,
      this.subLine4,
      this.commissionRate,
      this.isActive});
}

List<DriverRatingsModel> driverRatingList = [
  DriverRatingsModel(
      title: "Rising",
      imgUrl: "assets/svg_icon/rising.svg",
      subLine1: "Rating - 3-5 Star rating",
      subLine2: "Minimum AOA - 0%",
      subLine3: "Successful completion - 0%",
      subLine4: "Minimum monthly Total Tasks - 0",
      commissionRate: 20,
      isActive: true),
  DriverRatingsModel(
      title: "Expert",
      imgUrl: "assets/svg_icon/expert.svg",
      subLine1: "Rating - 4-5 Star rating",
      subLine2: "Minimum AOA - 80%",
      subLine3: "Successful completion - 80%",
      subLine4: "Minimum monthly Total Tasks - 50",
      commissionRate: 15,
      isActive: false),
  DriverRatingsModel(
      title: "Pro",
      imgUrl: "assets/svg_icon/pro.svg",
      subLine1: "Rating 4.5 - 5 Star rating",
      subLine2: "Minimum AOA - 90% or above",
      subLine3: "Successful completion - 90% or above",
      subLine4: "Minimum monthly Total Tasks - 100",
      commissionRate: 10,
      isActive: false),
];

class DriverRatings extends StatefulWidget {
  @override
  _DriverRatingsState createState() => _DriverRatingsState();
}

class _DriverRatingsState extends State<DriverRatings> {
  TextStyle inActiveStyle = TextStyle(color: Pendu.color('C8C8C8'));
  Color inActiveColor = Pendu.color('C8C8C8');
  Widget _buildActiveRating(DriverRatingsModel varRate) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 320,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 10,
            child: Container(
              padding: EdgeInsets.only(top: 50, left: 15.0, bottom: 15.0),
              height: 280,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(varRate.subLine1),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(varRate.subLine2),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(varRate.subLine3),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(varRate.subLine4),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Perks of Experts Status',
                        style: TextStyle(
                            color: Pendu.color('90A0B2'), fontSize: 15),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 20.0),
                          height: 1,
                          width: 80,
                          color: Theme.of(context).accentColor)
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0, top: 5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle, size: 12),
                            Text(
                              'Priority notification of the tasks',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.0),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 12),
                            Text(
                              'Low commission rate of 15%',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Container(
              height: 60,
              width: 240,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    height: 45,
                    width: 170,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                    ),
                    child: Text(
                      varRate.title,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SvgPicture.asset(
                    varRate.imgUrl,
                    height: 53,
                    width: 53,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.only(left: 5.0),
                      height: 45,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(50)),
                          color: Pendu.color('51BE8F')),
                      child: Column(
                        children: [
                          Text(
                            '${(varRate.commissionRate).round()}%',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text('Commission\nRate',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInActiveRating(DriverRatingsModel varRate) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 320,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 10,
            child: Container(
              padding: EdgeInsets.only(top: 50, left: 15.0, bottom: 15.0),
              height: 280,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: inActiveColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(varRate.subLine1, style: inActiveStyle),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: inActiveColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(varRate.subLine2, style: inActiveStyle),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: inActiveColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(varRate.subLine3, style: inActiveStyle),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: inActiveColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(varRate.subLine4, style: inActiveStyle),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Perks of Experts Status',
                        style: TextStyle(color: inActiveColor, fontSize: 15),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 20.0),
                          height: 1,
                          width: 80,
                          color: inActiveColor)
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0, top: 5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle, size: 12, color: inActiveColor),
                            Text(
                              'Priority notification of the tasks',
                              style:
                                  TextStyle(fontSize: 12, color: inActiveColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.0),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 12,
                              color: inActiveColor,
                            ),
                            Text(
                              'Low commission rate of 15%',
                              style:
                                  TextStyle(fontSize: 12, color: inActiveColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Container(
              height: 60,
              width: 240,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    height: 45,
                    width: 170,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Pendu.color('BCBCBC'),
                    ),
                    child: Text(
                      varRate.title,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SvgPicture.asset(
                    varRate.imgUrl,
                    height: 53,
                    width: 53,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.only(left: 5.0),
                      height: 45,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(50)),
                        color: Pendu.color('8F8F8F'),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${(varRate.commissionRate).round()}%',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text('Commission\nRate',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: driverRatingList.length,
        itemBuilder: (BuildContext context, int index) {
          return (driverRatingList[index].isActive)
              ? _buildActiveRating(driverRatingList[index])
              : _buildInActiveRating(driverRatingList[index]);
        },
      ),
    );
  }
}
