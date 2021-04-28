import 'package:flutter/material.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class JobsView extends StatefulWidget {
  @override
  _JobsViewState createState() => _JobsViewState();
}

class _JobsViewState extends State<JobsView>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    setState(() {
      tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBar(appBarTitle: 'Jobs'),
        ),
        body: Container(
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
            child: Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    ButtonsTabBar(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                      backgroundColor: Theme.of(context).primaryColor,
                      unselectedBackgroundColor: Colors.white,
                      borderColor: Pendu.color('90A0B2'),
                      borderWidth: 1,
                      unselectedBorderColor: Pendu.color('707070'),
                      labelStyle: TextStyle(color: Colors.white),
                      unselectedLabelStyle:
                          TextStyle(color: Pendu.color('90A0B2')),
                      tabs: [
                        Tab(text: ' Pending '),
                        Tab(text: 'Confirmed'),
                        Tab(text: 'In Progress'),
                        Tab(text: 'Completed'),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          JobsPending(),
                          JobsConfirmed(),
                          JobsInProgress(),
                          JobsCompleted(),
                          //  TaskPending(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
