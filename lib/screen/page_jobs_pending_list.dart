import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';

class JobsPendingListPage extends StatefulWidget {
  @override
  _JobsPendingListPageState createState() => _JobsPendingListPageState();
}

class _JobsPendingListPageState extends State<JobsPendingListPage> {
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
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 3.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      JobTaskCardUtils(),
                      Spacer(),
                      _buildButton(),
                      SizedBox(height: 2.0)
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
