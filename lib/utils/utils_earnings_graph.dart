import 'package:flutter/material.dart';

import 'package:pendu_driver/utils/utils.dart';

import 'package:fl_chart/fl_chart.dart';

class EarningsGraphUtils extends StatefulWidget {
  @override
  _EarningsGraphUtilsState createState() => _EarningsGraphUtilsState();
}

class _EarningsGraphUtilsState extends State<EarningsGraphUtils>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = [
      const Color(0xff60E99C),
    ];
    final List<Color> gradientColorsWeek = [
      const Color(0xffFFCE8A),
    ];
    final List<Color> gradientColorsMonth = [
      const Color(0xff29ABE2),
    ];
    final List<Color> gradientColorsYear = [
      const Color(0xffCCABFF),
    ];
    List<FlSpot> daysList = [
      FlSpot(1, 2),
      FlSpot(2, 5),
      FlSpot(3, 2.5),
      FlSpot(4, 4),
      FlSpot(5, 3),
    ];
    List<FlSpot> weeksList = [
      FlSpot(1, 2),
      FlSpot(2, 5),
      FlSpot(3, 2.5),
      FlSpot(4, 4),
      FlSpot(5, 3),
      FlSpot(6, 1),
      FlSpot(7, 3.5),
    ];
    List<FlSpot> monthList = [
      FlSpot(1, 2),
      FlSpot(2, 5),
      FlSpot(5, 2.5),
      FlSpot(8, 2),
      FlSpot(10, 5),
      FlSpot(13, 2.5),
      FlSpot(16, 4),
      FlSpot(19, 3),
      FlSpot(21, 1),
      FlSpot(23, 4),
      FlSpot(26, 3),
      FlSpot(28, 1),
      FlSpot(30, 3.5),
    ];
    List<FlSpot> yearList = [
      FlSpot(1, 2),
      FlSpot(2, 5),
      FlSpot(3, 2.5),
      FlSpot(4, 4),
      FlSpot(5, 3),
      FlSpot(6, 1),
      FlSpot(7, 3.5),
      FlSpot(8, 2.5),
      FlSpot(9, 4),
      FlSpot(10, 3),
      FlSpot(11, 1),
      FlSpot(12, 3),
    ];

    Widget _buildGraphDay() {
      return LineChart(
        LineChartData(
          minX: 1,
          maxX: daysList.length.toDouble(),
          minY: 0,
          maxY: 6,
          titlesData: GraphLineTitles.getTitleData(),
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
            ),
          ],
        ),
      );
    }

    Widget _buildGraphWeek() {
      return LineChart(
        LineChartData(
          minX: 1,
          maxX: weeksList.length.toDouble(),
          minY: 0,
          maxY: 6,
          titlesData: GraphLineTitles.getWeekData(),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey,
                strokeWidth: .5,
              );
            },
            drawVerticalLine: false,
          ),
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: weeksList,
              isCurved: true,
              colors: gradientColorsWeek,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildGraphMonth() {
      return LineChart(
        LineChartData(
          minX: 1,
          maxX: 30,
          minY: 0,
          maxY: 6,
          titlesData: GraphLineTitles.getMonthData(),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey,
                strokeWidth: .5,
              );
            },
            drawVerticalLine: false,
          ),
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: monthList,
              isCurved: true,
              colors: gradientColorsMonth,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildGraphYear() {
      return LineChart(
        LineChartData(
          minX: 1,
          maxX: yearList.length.toDouble(),
          minY: 0,
          maxY: 6,
          titlesData: GraphLineTitles.getYearData(),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey,
                strokeWidth: .5,
              );
            },
            drawVerticalLine: false,
          ),
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: yearList,
              isCurved: true,
              colors: gradientColorsYear,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
              ),
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
              _buildGraphWeek(),
              _buildGraphMonth(),
              _buildGraphYear(),
            ]),
          ),
        ],
      ),
    );
  }
}
