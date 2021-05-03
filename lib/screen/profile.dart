import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rating_bar/rating_bar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AllDAata varA = AllDAata();
  double _rating = 4.00;

  // SliverAppBar is declared in Scaffold.body, in slivers of a
  // CustomScrollView.
  @override
  Widget build(BuildContext context) {
    Widget _buildAppBarTopSection() {
      return Container(
          margin: EdgeInsets.only(bottom: 10.0),
          height: 200,
          width: double.infinity,
          color: Colors.white,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  //  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                      image: AssetImage('assets/images/profile_back.png'),
                      fit: BoxFit.fill),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundColor: Pendu.color('5BDB98'),
                    child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(varA.profileUrl)),
                  ),
                  Text(
                    varA.profileName,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Active',
                    style: TextStyle(
                        fontSize: 12, color: Theme.of(context).accentColor),
                  ),
                ],
              )
            ],
          ));
    }

    Widget _buildCardSection() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Card
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                  image: AssetImage('assets/images/card_back.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Balance',
                    style: PenduTextStyle().whiteTextStyle,
                  ),
                ),
                Text(
                  '\$1225.00',
                  style: TextStyle(
                      fontSize: 26, color: Theme.of(context).accentColor),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Pendu.color('90A0B2')),
                  child: Row(
                    children: [
                      Text(
                        'Your driver status',
                        style: PenduTextStyle().whiteTextStyle,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset('assets/svg_icon/rising.svg'),
                      ),
                      Text(
                        'Rising',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
    }

    Widget _buildBottomSection() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Overall Ratings Container
          Container(
            height: 120,
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Pendu.color('FFB44A'),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Pendu.color('FFCE8A'),
                  Pendu.color('FFB44A'),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Overall rating',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text('$_rating', style: PenduTextStyle().whiteTextStyle),
                IgnorePointer(
                  child: RatingBar(
                    onRatingChanged: (rating) => null,
                    initialRating: _rating,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star,
                    halfFilledIcon: Icons.star_half,
                    isHalfAllowed: true,
                    filledColor: Colors.white,
                    emptyColor: Colors.grey,
                    halfFilledColor: Pendu.color('FFB44A'),
                    size: 16,
                  ),
                ),
                Text('(125)', style: PenduTextStyle().whiteTextStyle)
              ],
            ),
          ),
          //Accuracy Rate Container
          Container(
            height: 120,
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Pendu.color('FFB44A'),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Pendu.color('60E99C'),
                  Pendu.color('56CD93'),
                ],
              ),
            ),
            child: CircularPercentIndicator(
              radius: 65.0,
              lineWidth: 7.0,
              percent: .89,
              backgroundColor: Colors.white.withOpacity(0.5),
              header: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Accuracy rate',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              center: new Text('90%',
                  style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0)),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.white,
            ),
          ),
          //Accuracy Rate Container
          Container(
            height: 120,
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Pendu.color('FFB44A'),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Pendu.color('CCABFF'),
                  Pendu.color('B788FF'),
                ],
              ),
            ),
            child: CircularPercentIndicator(
              radius: 65.0,
              lineWidth: 7.0,
              percent: .95,
              backgroundColor: Colors.white.withOpacity(0.5),
              header: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Success rate',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              center: new Text('95%',
                  style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0)),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.white,
            ),
          )
        ],
      );
    }

    Widget _buildMenuList({String title, String iconUrl, String colorCode}) {
      return Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            padding: EdgeInsets.all(5.0),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Pendu.color(colorCode)),
            child: SvgPicture.asset(iconUrl),
          ),
          Text(title),
        ],
      );
    }

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: true,
              expandedHeight: _height * 0.70,
              collapsedHeight: 200,
              backgroundColor: Colors.white,
              flexibleSpace: Container(
                child: ListView(
                  children: [
                    //Profile pic container
                    _buildAppBarTopSection(),
                    //Card Section
                    _buildCardSection(),
                    //Bottom container
                    _buildBottomSection()
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Center(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          splashColor: Colors.white,
                          child: _buildMenuList(
                              title: 'Profile info',
                              iconUrl: 'assets/svg_icon/profile_info.svg',
                              colorCode: '65CAFF'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          splashColor: Colors.white,
                          child: _buildMenuList(
                              title: 'Earnings',
                              iconUrl: 'assets/svg_icon/earnings.svg',
                              colorCode: 'FF7872'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          splashColor: Colors.white,
                          child: _buildMenuList(
                              title: 'Updates',
                              iconUrl: 'assets/svg_icon/updates.svg',
                              colorCode: '7C79F8'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          splashColor: Colors.white,
                          child: _buildMenuList(
                              title: 'Payments card',
                              iconUrl: 'assets/svg_icon/payments_card.svg',
                              colorCode: 'FF8D00'),
                        ),
                        SizedBox(height: 15.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          splashColor: Colors.white,
                          child: _buildMenuList(
                              title: 'Refer a friend',
                              iconUrl: 'assets/svg_icon/refer_friend.svg',
                              colorCode: '90A0B2'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          splashColor: Colors.white,
                          child: _buildMenuList(
                              title: 'Notification settigs',
                              iconUrl:
                                  'assets/svg_icon/notification_settigs.svg',
                              colorCode: '5BDB98'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          splashColor: Colors.white,
                          child: _buildMenuList(
                              title: 'Bankings details',
                              iconUrl: 'assets/svg_icon/bankings_details.svg',
                              colorCode: 'FEC303'),
                        ),
                        SizedBox(height: 15.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          splashColor: Colors.white,
                          child: _buildMenuList(
                              title: 'Chat support',
                              iconUrl: 'assets/svg_icon/chat_support.svg',
                              colorCode: '579AFF'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          splashColor: Colors.white,
                          child: _buildMenuList(
                              title: 'FAQs',
                              iconUrl: 'assets/svg_icon/faq.svg',
                              colorCode: 'B788FF'),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  AppVersionPopUp(),
                            );
                          },
                          splashColor: Colors.white,
                          child: _buildMenuList(
                              title: 'App version',
                              iconUrl: 'assets/svg_icon/app_version.svg',
                              colorCode: 'F97A7A'),
                        ),
                      ],
                    )),
              ),
            ),

            // SliverToBoxAdapter(
            //   child: Expanded(
            //     child: ListView(
            //       children: [
            //         _buildMenuList(
            //             title: 'Profile info',
            //             iconUrl: 'assets/svg_icon/profile_info.svg',
            //             colorCode: '65CAFF'),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
