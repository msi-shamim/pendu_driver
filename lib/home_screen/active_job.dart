import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_driver/utils/utils.dart';

class ActiveJob extends StatefulWidget {
  @override
  _ActiveJobState createState() => _ActiveJobState();
}

class _ActiveJobState extends State<ActiveJob> {
  Widget _buildChip({String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Pendu.color('FFF2DF'),
      ),
      child: Text(
        label,
        style: PenduTextStyle().fadedTextStyle,
      ),
    );
  }

  Widget _buildTask() {
    return Card(
      elevation: 5.0,
      child: Container(
        height: 180,
        padding: EdgeInsets.only(
          left: 5.0,
          bottom: 5.0,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          children: [
            Row(
              children: [
                //Todo left user colume
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                //Todo right delivery column
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 140,
                    margin: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        DeliverAddressTable(),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            _buildChip(label: 'Grocery'),
                            _buildChip(label: 'Electronics'),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '4X Items',
                              style: PenduTextStyle().fadedTextStyle,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 + 80,
              height: 35,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  // side: BorderSide(
                  //   color: Pendu.color('90A0B2'),
                  // ),
                ),
                child: Text(
                  'Continue task',
                  style: PenduTextStyle().btnStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        children: [
          Text(
            'Active job',
            style: PenduTextStyle().headerStyle,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            width: MediaQuery.of(context).size.width - 10,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildTask(),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Theme.of(context).primaryColor,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      // side: BorderSide(
                      //   color: Pendu.color('90A0B2'),
                      // ),
                    ),
                    child: Text(
                      'Start searching jobs',
                      style: PenduTextStyle().btnStyle,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
