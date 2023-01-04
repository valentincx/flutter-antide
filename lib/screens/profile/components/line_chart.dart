import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../theme/constants.dart';
import 'indicator.dart';

class LineChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.23,
        child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(16)),
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Average sleep per month",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(14)),
                    ),
                    Row(
                      children: <Widget>[
                        Indicator(
                          color:
                              (Theme.of(context).brightness == Brightness.dark)
                                  ? primaryColorLight
                                  : kPrimaryColorLight,
                          text: 'Light',
                          isSquare: false,
                          size: getProportionateScreenWidth(12),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        Indicator(
                          color:
                              (Theme.of(context).brightness == Brightness.dark)
                                  ? primaryColorDark
                                  : kPrimaryColorDark,
                          text: 'Deep',
                          isSquare: false,
                          size: getProportionateScreenWidth(12),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 37,
                    ),
                    Expanded(
                      child: LineChart(
                        sampleData1(),
                        swapAnimationDuration:
                            const Duration(milliseconds: 250),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            )));
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => TextStyle(
            color: Theme.of(context).textTheme.bodyText2.color,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Dec';
              case 1:
                return 'Jan';
              case 2:
                return 'Feb';
              case 3:
                return 'Mar';
              case 4:
                return 'Apr';
              case 5:
                return 'May';
              case 6:
                return 'Jun';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(
            color: Theme.of(context).textTheme.bodyText2.color,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 2:
                return '2';
              case 4:
                return '4';
              case 6:
                return '6';
              case 8:
                return '8';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).textTheme.bodyText2.color.withOpacity(0.5),
            width: 2,
          ),
          left: BorderSide(
            color: Theme.of(context).textTheme.bodyText2.color.withOpacity(0.5),
            width: 2,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 7,
      maxY: 8,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 2),
        FlSpot(2, 2.5),
        FlSpot(3, 2.4),
        FlSpot(4, 3.4),
        FlSpot(5, 2),
        FlSpot(6, 2.2),
      ],
      isCurved: true,
      colors: [
        (Theme.of(context).brightness == Brightness.dark)
            ? primaryColorLight
            : kPrimaryColorLight
      ],
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 5),
        FlSpot(2, 4.8),
        FlSpot(3, 6.2),
        FlSpot(4, 5.8),
        FlSpot(5, 5.6),
        FlSpot(6, 4.9),
      ],
      isCurved: true,
      colors: [
        (Theme.of(context).brightness == Brightness.dark)
            ? primaryColorDark
            : kPrimaryColorDark
      ],
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false),
    );

    return [
      lineChartBarData1,
      lineChartBarData2,
    ];
  }
}
