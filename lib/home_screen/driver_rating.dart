import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';

class DriverRatings extends StatefulWidget {
  @override
  _DriverRatingsState createState() => _DriverRatingsState();
}

class _DriverRatingsState extends State<DriverRatings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
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
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
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
                      Text('Rating 4-5 Star rating'),
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
                      Text('Rating 4-5 Star rating'),
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
                      Text('Rating 4-5 Star rating'),
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
                      Text('Rating 4-5 Star rating'),
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
            top: 0,
            child: Container(
              height: 50,
              width: 200,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
