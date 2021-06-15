import 'package:flutter/material.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:timelines/timelines.dart';

// ignore: must_be_immutable
class TimeLine extends StatefulWidget {
  int screenValue = 0;
  TimeLine({this.screenValue});
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  final double hightValue = 12;

  @override
  Widget build(BuildContext context) {
    Widget _buildCheckBox({Color boxColor}) {
      return Container(
        padding: EdgeInsets.all(3.0),
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            border: Border.all(color: boxColor, width: 2.5),
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.white),
        child: Container(color: boxColor),
      );
    }

    Widget _buildUnCheckBox({Color boxColor}) {
      return Container(
        padding: EdgeInsets.all(3.0),
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            border: Border.all(color: boxColor, width: 2.5),
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.white),
      );
    }

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
          InkWell(
            onTap: () {
              setState(() {
                widget.screenValue = 1;
              });
            },
            child: TimelineTile(
              direction: Axis.vertical,
              nodeAlign: TimelineNodeAlign.start,
              oppositeContents: null,
              contents: Container(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('Driving to pickup'),
              ),
              node: TimelineNode(
                indicator: ContainerIndicator(
                    child: (widget.screenValue >= 1)
                        ? _buildCheckBox(boxColor: Pendu.color('F97A7A'))
                        : _buildUnCheckBox(boxColor: Pendu.color('F97A7A'))),
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
          ),

          //2
          InkWell(
            onTap: () {
              setState(() {
                widget.screenValue = 2;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shopping()),
              );
            },
            child: TimelineTile(
              direction: Axis.vertical,
              nodeAlign: TimelineNodeAlign.start,
              oppositeContents: null,
              contents: Container(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('Shopping started'),
              ),
              node: TimelineNode(
                indicator: ContainerIndicator(
                    child: (widget.screenValue >= 2)
                        ? _buildCheckBox(boxColor: Pendu.color('FFCE8A'))
                        : _buildUnCheckBox(boxColor: Pendu.color('FFCE8A'))),
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
          ),
//3
          InkWell(
            onTap: () {
              setState(() {
                widget.screenValue = 3;
              });
            },
            child: TimelineTile(
              direction: Axis.vertical,
              nodeAlign: TimelineNodeAlign.start,
              oppositeContents: null,
              contents: Container(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('Strat delivery'),
              ),
              node: TimelineNode(
                indicator: ContainerIndicator(
                    child: (widget.screenValue >= 3)
                        ? _buildCheckBox(boxColor: Pendu.color('29ABE2'))
                        : _buildUnCheckBox(boxColor: Pendu.color('29ABE2'))),
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
          ),
        ],
      ),
    );
  }
}
