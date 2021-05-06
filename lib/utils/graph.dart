import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:pendu_driver/utils/utils.dart';

import 'package:fl_chart/fl_chart.dart';

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  var daysData = [0.7, 0.3, 0.9, 1.0, 0.5];
  var weeksData = [0.8, 0.9, 1.0, 0.5, 0.2, 0.7, 0.3];
  var monthData = [0.1, 0.7, 0.3, 0.9, 1.0, 0.5, 0.0, 0.8, 0.2, 0.4, 0.3, 0.9];
  var yearsData = [0.0, 0.8, 0.2, 0.4];

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = [
      const Color(0xff60E99C),
    ];
    List<FlSpot> daysList = [
      FlSpot(1, 2),
      FlSpot(2, 5),
      FlSpot(3, 2.5),
      FlSpot(4, 4),
      FlSpot(5, 3),
      FlSpot(6, 1),
    ];
    Widget _buildGraph({var dataListName, String colorCode}) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
        color: Colors.transparent,
        child: Sparkline(
          data: dataListName,
          sharpCorners: false,
          lineColor: Pendu.color(colorCode),
          pointsMode: PointsMode.all,
          pointColor: Colors.black,
          pointSize: 5.0,
        ),
      );
    }

    Widget _buildGraphDay() {
      return LineChart(
        LineChartData(
          minX: 1,
          maxX: daysList.length.toDouble(),
          minY: 0,
          maxY: 6,
          titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey,
                strokeWidth: .5,
              );
            },
            drawVerticalLine: false,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey,
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: daysList,
              isCurved: true,
              colors: gradientColors,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
              ),
              // belowBarData: BarAreaData(
              //   show: true,
              //   colors: gradientColors
              //       .map((color) => color.withOpacity(0.3))
              //       .toList(),
              // ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.grey[200],
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 2.0),
              indicatorWeight: 2.0,
              controller: tabController,
              tabs: [
                Text('Days'),
                Text('Weeks'),
                Text('Months'),
                Text('Years'),
              ],
            ),
          ),
          Container(
            //margin: EdgeInsets.symmetric(horizontal: 10.0),
            height: 150,
            child: TabBarView(controller: tabController, children: [
              // _buildGraph(dataListName: daysData, colorCode: '5BDB98'),
              _buildGraphDay(),
              _buildGraph(dataListName: weeksData, colorCode: 'FFCE8A'),
              _buildGraph(dataListName: monthData, colorCode: '29ABE2'),
              _buildGraph(dataListName: yearsData, colorCode: 'CCABFF'),
            ]),
          ),
        ],
      ),
    );
  }
}
