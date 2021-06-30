import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/main_landing_page.dart';
import 'package:pendu_driver/screen/home_screen/page_home.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';

// ignore: must_be_immutable
class JobTimelinePage extends StatefulWidget {
  int screenValue = 1;
  JobTimelinePage({this.screenValue});

  @override
  _JobTimelinePageState createState() => _JobTimelinePageState();
}

class _JobTimelinePageState extends State<JobTimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBarUtils(appBarTitle: 'Job Timeline'),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg_icon/delivery_img.svg'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Task ID- '),
                      Text(
                        '26522126665',
                        style: TextStyle(
                            color: Pendu.color('90A0B2'), fontSize: 16),
                      )
                    ],
                  ),
                  TaskTimeLineUtils(
                    screenValue: widget.screenValue,
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Pendu.color('BAC5D2'),
                          Pendu.color('BAC5D2'),
                          Pendu.color('90A0B2'),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        DeliverAddressTableUtils(
                          lineHight: 15,
                          defineTextSTyle:
                              TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MainLandingPage(seclectValue: 0)),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Pendu.color('FFCE8A'),
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Text('Home'),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (builder) {
                                      return ConfirmDeliveryPopUpUtils();
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Theme.of(context).accentColor,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Text('Confirm delivery'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
