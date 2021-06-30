import 'package:flutter/material.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class NoticeBoard extends StatefulWidget {
  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  Widget _buildNotice({String discription, date, time, colorCode}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.check_circle, color: Pendu.color(colorCode), size: 45),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //  color: Colors.red,
                // margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width / 1.4,
                child: Text(
                  discription,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Text(date, style: PenduTextStyle().fadedTextStyle),
                  SizedBox(width: 20),
                  Text(time, style: PenduTextStyle().fadedTextStyle)
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NoticeBoardPage()));
        },
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
          'See all',
          style: PenduTextStyle().btnStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Notice Board',
            style: PenduTextStyle().headerStyle,
          ),
          Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    _buildNotice(
                        discription:
                            "Lorem ipsum dolor sit amet, conse tetur sadipscing elitr….",
                        date: "15.10.2020",
                        time: "01.43 PM",
                        colorCode: "29ABE2"),
                    _buildNotice(
                        discription:
                            "Lorem ipsum dolor sit amet, conse tetur sadipscing elitr….",
                        date: "15.10.2020",
                        time: "01.43 PM",
                        colorCode: "5BDB98"),
                    _buildNotice(
                        discription:
                            "Lorem ipsum dolor sit amet, conse tetur sadipscing elitr….",
                        date: "15.10.2020",
                        time: "01.43 PM",
                        colorCode: "FFCE8A"),
                    _buildButton(),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
