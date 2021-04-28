import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:timelines/timelines.dart';

class TimeLine extends StatelessWidget {
  final int screenValue;
  double hightValue = 12;

  TimeLine({@required this.screenValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      height: 150,
      width: 150,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1
          TimelineTile(
            direction: Axis.vertical,
            nodeAlign: TimelineNodeAlign.start,
            oppositeContents: null,
            contents: Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Driving to pickup'),
            ),
            node: TimelineNode(
              indicator: ContainerIndicator(
                  child: (screenValue >= 1)
                      ? Icon(
                          Icons.check_box_outlined,
                          color: Pendu.color('F97A7A'),
                        )
                      : Icon(
                          Icons.check_box_outline_blank,
                          color: Pendu.color('F97A7A'),
                        )),
              endConnector: SizedBox(
                height: hightValue,
                child: DashedLineConnector(
                  thickness: 1,
                  dash: 2,
                  gap: 2,
                  color: Pendu.color('707070'),
                ),
              ),
            ),
          ),

          //2
          TimelineTile(
            direction: Axis.vertical,
            nodeAlign: TimelineNodeAlign.start,
            oppositeContents: null,
            contents: Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Shopping started'),
            ),
            node: TimelineNode(
              indicator: ContainerIndicator(
                child: (screenValue >= 2)
                    ? Icon(
                        Icons.check_box_outlined,
                        color: Pendu.color('FFCE8A'),
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        color: Pendu.color('FFCE8A'),
                      ),
              ),
              startConnector: SizedBox(
                height: hightValue,
                child: DashedLineConnector(
                  thickness: 1,
                  dash: 2,
                  gap: 2,
                  color: Pendu.color('707070'),
                ),
              ),
              endConnector: SizedBox(
                height: hightValue,
                child: DashedLineConnector(
                  thickness: 1,
                  dash: 2,
                  gap: 2,
                  color: Pendu.color('707070'),
                ),
              ),
            ),
          ),
//3
          TimelineTile(
            direction: Axis.vertical,
            nodeAlign: TimelineNodeAlign.start,
            oppositeContents: null,
            contents: Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Shopping started'),
            ),
            node: TimelineNode(
              indicator: ContainerIndicator(
                child: (screenValue >= 3)
                    ? Icon(
                        Icons.check_box_outlined,
                        color: Pendu.color('29ABE2'),
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        color: Pendu.color('29ABE2'),
                      ),
              ),
              startConnector: SizedBox(
                height: hightValue,
                child: DashedLineConnector(
                  thickness: 1,
                  dash: 2,
                  gap: 2,
                  color: Pendu.color('707070'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
