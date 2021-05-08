import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/utils/utils.dart';

class ProfileNoticeBoard extends StatefulWidget {
  @override
  _ProfileNoticeBoardState createState() => _ProfileNoticeBoardState();
}

class _ProfileNoticeBoardState extends State<ProfileNoticeBoard> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBar(appBarTitle: 'Notice Board'),
        ),
        body: Container(
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child:
                          SvgPicture.asset('assets/svg_icon/update_menu.svg')),
                  SizedBox(height: 25.0),
                  Expanded(
                    child: ListView(
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
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
