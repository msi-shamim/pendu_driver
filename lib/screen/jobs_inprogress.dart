import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';

class JobsInProgress extends StatefulWidget {
  @override
  _JobsInProgressState createState() => _JobsInProgressState();
}

class _JobsInProgressState extends State<JobsInProgress> {
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
          'Start Task',
          style: PenduTextStyle().btnStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
          ),
          height: 230,
          // width: 200,
          child: Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                JobTaskCard(),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, top: 5.0),
                  child: Text('Delivery fee- \$15'),
                ),
                Spacer(),
                _buildStartButton(),
                SizedBox(height: 20.0),
              ],
            ),
          )),
    );
  }
}
