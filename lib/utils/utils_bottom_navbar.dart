// import 'package:flutter/material.dart';
// import 'package:motion_tab_bar/MotionTabController.dart';
// import 'package:pendu_driver/screen/screen.dart';
// import 'package:pendu_driver/utils/utils.dart';
// import 'package:motion_tab_bar/motiontabbar.dart';

// class BottomNavigation extends StatefulWidget {
//   final String initValue;
//   BottomNavigation({this.initValue});

//   @override
//   _BottomNavigationState createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation>
//     with TickerProviderStateMixin {
//   MotionTabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController =
//         MotionTabController(initialIndex: 0, vsync: this, length: 4);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MotionTabBar(
//       labels: ["Home", "Jobs", "Messages", "My profile"],
//       initialSelectedTab: widget.initValue,
//       tabIconColor: Colors.black,
//       tabSelectedColor: Pendu.color('1B3149'),
//       onTabItemSelected: (int value) {
//         setState(() {
//           _tabController.index = value;
//         });
//         if (value == 0) {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => HomePage()));
//         } else if (value == 1) {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => JobsView()));
//         } else if (value == 2) {
//           // Navigator.push(context,
//           //     MaterialPageRoute(builder: (context) => ProfileChatSupport()));
//         } else if (value == 3) {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => ProfileWithMenuPage()));
//         }
//       },
//       icons: [
//         PenduIcon.home_icon,
//         PenduIcon.jobs_icon,
//         PenduIcon.message_icon,
//         PenduIcon.profile_icon
//       ],
//       textStyle: TextStyle(color: Colors.black),
//     );
//   }
// }
