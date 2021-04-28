import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';

class JobsPending extends StatefulWidget {
  @override
  _JobsPendingState createState() => _JobsPendingState();
}

class _JobsPendingState extends State<JobsPending> {
  Widget _buildButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Pendu.color('FFCE8A'),
          onPrimary: Colors.white,
        ),
        child: Text(
          'Awaiting customer Confirmation',
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
          height: 200,
          // width: 200,
          child: Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                JobTaskCard(),
                Spacer(),
                _buildButton(),
                SizedBox(height: 2.0)
              ],
            ),
          )),
    );
  }
}
