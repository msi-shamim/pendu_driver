import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 25,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1';
              case 2:
                return '2';
              case 3:
                return '3';
              case 4:
                return '4';
              case 5:
                return '5';
              case 6:
                return '6';
              case 7:
                return '7';
              case 8:
                return '8';
              case 9:
                return '9';
              case 10:
                return '10';
            }
            return '';
          },
          margin: 0,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            return '';
          },
          reservedSize: 10,
          margin: 1,
        ),
        rightTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            return '';
          },
          reservedSize: 10,
          margin: 1,
        ),
      );
  static getWeekData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 25,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Sun';
              case 2:
                return 'Mon';
              case 3:
                return 'Tue';
              case 4:
                return 'Wed';
              case 5:
                return 'Thu';
              case 6:
                return 'Fri';
              case 7:
                return 'Sat';
            }
            return '';
          },
          margin: 0,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            return '';
          },
          reservedSize: 10,
          margin: 1,
        ),
        rightTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            return '';
          },
          reservedSize: 10,
          margin: 1,
        ),
      );
  static getMonthData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 25,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '2';
              case 5:
                return '5';
              case 8:
                return '8';
              case 11:
                return '11';
              case 14:
                return '14';
              case 17:
                return '17';
              case 20:
                return '20';
              case 23:
                return '23';
              case 26:
                return '26';
              case 29:
                return '29';
            }
            return '';
          },
          margin: 0,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            return '';
          },
          reservedSize: 10,
          margin: 1,
        ),
        rightTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            return '';
          },
          reservedSize: 10,
          margin: 1,
        ),
      );
  static getYearData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 25,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'Feb';

              case 5:
                return 'May';

              case 8:
                return 'Aug';

              case 11:
                return 'Nov';
            }
            return '';
          },
          margin: 0,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            return '';
          },
          reservedSize: 10,
          margin: 1,
        ),
        rightTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            return '';
          },
          reservedSize: 10,
          margin: 1,
        ),
      );
}
