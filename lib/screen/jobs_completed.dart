import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';

class JobsCompleted extends StatefulWidget {
  @override
  _JobsCompletedState createState() => _JobsCompletedState();
}

class _JobsCompletedState extends State<JobsCompleted> {
  Widget _buildStartButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 80,
      height: 38,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).primaryColor,
          onPrimary: Colors.white,
        ),
        child: Text(
          'Review your experience',
          style: PenduTextStyle().btnStyle,
        ),
      ),
    );
  }

  Widget _buildBottomContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width - 30,
      height: 40,
      decoration: BoxDecoration(
        color: Pendu.color('FFB44A'),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0)),
      ),
      child: Row(
        children: [
          Text(
            'You have reviewed',
            style: PenduTextStyle().btnStyle,
          ),
          Spacer(),
          Icon(
            Icons.star,
            size: 18.0,
            color: Colors.white,
          ),
          SizedBox(width: 5),
          Text(
            '5.00',
            style: PenduTextStyle().whiteTextStyle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 220,
              // width: 200,
              child: Card(
                elevation: 3.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    JobTaskCard(),
                    Spacer(),
                    _buildStartButton(),
                    SizedBox(height: 20.0),
                  ],
                ),
              )),
          Container(
              padding: EdgeInsets.only(top: 70), child: Text('If reviewd')),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 200,
              // width: 200,
              child: Card(
                elevation: 3.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    JobTaskCard(),
                    Spacer(),
                    _buildBottomContainer(),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
