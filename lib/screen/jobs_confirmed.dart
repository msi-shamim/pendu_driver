import 'package:flutter/material.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class JobsConfirmed extends StatefulWidget {
  @override
  _JobsConfirmedState createState() => _JobsConfirmedState();
}

class _JobsConfirmedState extends State<JobsConfirmed> {
  Widget _buildChatButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 50,
      height: 38,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (builder) {
              return MessageScreeen();
            },
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.white,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: BorderSide(
            color: Pendu.color('90A0B2'),
          ),
        ),
        child: Text(
          'Chat',
          style: TextStyle(color: Pendu.color('90A0B2'), fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildStartButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 30,
      height: 38,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => JobTimeline1(
                        screenValue: 1,
                      )));
        },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [_buildChatButton(), _buildStartButton()],
                ),
                SizedBox(height: 20.0),
              ],
            ),
          )),
    );
  }
}
