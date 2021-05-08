import 'package:flutter/material.dart';
import 'package:pendu_driver/screen/screen.dart';

import 'package:pendu_driver/utils/utils.dart';

class JobTaskCard extends StatelessWidget {
  const JobTaskCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TaskView()));
      },
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Left user profile
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(top: 10.0, left: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg'),
                                  fit: BoxFit.cover)),
                        ),
                        Text('Nicolas L.'),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 16.0,
                              color: Pendu.color('FFB44A'),
                            ),
                            SizedBox(width: 7),
                            Text(
                              '4.89',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //Rightside
                Expanded(
                  flex: 6,
                  child: Container(
                      margin: EdgeInsets.only(left: 10.0),
                      //height: 120,
                      //  width: 20,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0),
                                height: 20,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Pendu.color('90A0B2'),
                                    borderRadius: BorderRadius.only(
                                      //  topRight: Radius.circular(4.0),
                                      bottomLeft: Radius.circular(5.0),
                                    )),
                                child: Text(
                                  'Shop & Drop',
                                  style: PenduTextStyle().whiteTextStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          DeliverAddressTable(
                            lineHight: 20,
                            defineTextSTyle: TextStyle(
                                color: Pendu.color('90A0B2'), fontSize: 10),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              ProductChip(
                                label: 'Grocery',
                              ),
                              ProductChip(
                                label: 'Electronics',
                              ),
                            ],
                          ),
                          Text('4X items',
                              style: PenduTextStyle().fadedTextStyle2)
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
