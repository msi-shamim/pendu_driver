import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pendu_driver/screen/home_screen/page_home.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class MainLandingPage extends StatefulWidget {
  final int seclectValue;
  MainLandingPage({Key key, @required this.seclectValue}) : super(key: key);

  @override
  _MainLandingPageState createState() => _MainLandingPageState(seclectValue);
}

class _MainLandingPageState extends State<MainLandingPage> {
  final int seclectValue;
  _MainLandingPageState(this.seclectValue);
  int selectedIndex;
  Widget _body;
  @override
  void initState() {
    selectedIndex = seclectValue;

    _changeBody(selectedIndex);
    super.initState();
  }

  void _changeBody(int selectedIndex) {
    setState(() {
      if (selectedIndex == 0) {
        _body = HomePage();
      } else if (selectedIndex == 1) {
        _body = JobsViewPage();
      } else if (selectedIndex == 2) {
        _body = PenduChatSupportPage();
      } else if (selectedIndex == 3) {
        _body = ProfileWithMenuPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Theme.of(context).primaryColor,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          unselectedItemBackgroundColor: Colors.white,
          unselectedItemIconColor: Theme.of(context).primaryColor,
          unselectedItemLabelColor: Colors.black38,
          barHeight: 60,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          selectedIndex = index;
          _changeBody(selectedIndex);
        },
        items: [
          FFNavigationBarItem(
            iconData: PenduIcon.home_icon,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: PenduIcon.jobs_icon,
            label: 'Jobs',
          ),
          FFNavigationBarItem(
            iconData: Icons.mail_outline_rounded,
            label: 'Message',
          ),
          FFNavigationBarItem(
            iconData: PenduIcon.profile_icon,
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}
