import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../theme/constants.dart';
import 'indicator.dart';

class BarChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 7;

  int touchedGroupIndex;

  @override
  Widget build(BuildContext context) {
    var lightColor = (Theme.of(context).brightness == Brightness.dark)
        ? primaryColorLight
        : kPrimaryColorLight;
    var darkColor = (Theme.of(context).brightness == Brightness.dark)
        ? primaryColorDark
        : kPrimaryColorDark;

    final barGroup1 = makeGroupData(lightColor, darkColor, 0, 1, 5);
    final barGroup2 = makeGroupData(lightColor, darkColor, 1, 2, 6);
    final barGroup3 = makeGroupData(lightColor, darkColor, 2, 1.5, 4.5);
    final barGroup4 = makeGroupData(lightColor, darkColor, 3, 2, 5);
    final barGroup5 = makeGroupData(lightColor, darkColor, 4, 1.5, 5);
    final barGroup6 = makeGroupData(lightColor, darkColor, 5, 2, 4.5);
    final barGroup7 = makeGroupData(lightColor, darkColor, 6, 3.5, 6);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "This Week's stats",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(14)),
            ),
            Row(
              children: <Widget>[
                Indicator(
                  color: (Theme.of(context).brightness == Brightness.dark)
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
                  color: (Theme.of(context).brightness == Brightness.dark)
                      ? primaryColorDark
                      : kPrimaryColorDark,
                  text: 'Deep',
                  isSquare: false,
                  size: getProportionateScreenWidth(12),
                ),
              ],
            ),
          ]),
          SizedBox(
            height: getProportionateScreenHeight(38),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BarChart(
                BarChartData(
                  maxY: 8,
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => TextStyle(
                          color: Theme.of(context).textTheme.bodyText2.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                      margin: 20,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Mn';
                          case 1:
                            return 'Te';
                          case 2:
                            return 'Wd';
                          case 3:
                            return 'Tu';
                          case 4:
                            return 'Fr';
                          case 5:
                            return 'St';
                          case 6:
                            return 'Sn';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => TextStyle(
                          color: Theme.of(context).textTheme.bodyText2.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                      margin: 32,
                      reservedSize: 14,
                      getTitles: (value) {
                        if (value == 0) {
                          return '0';
                        } else if (value == 4) {
                          return '4';
                        } else if (value == 8) {
                          return '8';
                        } else {
                          return '';
                        }
                      },
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: items,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
      Color lightColor, Color darkColor, int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [lightColor],
        width: width,
      ),
      BarChartRodData(
        y: y2,
        colors: [darkColor],
        width: width,
      ),
    ]);
  }

  Widget makeTransactionsIcon() {
    const double width = 4.5;
    const double space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Theme.of(context).textTheme.bodyText2.color.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Theme.of(context).textTheme.bodyText2.color.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Theme.of(context).textTheme.bodyText2.color.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Theme.of(context).textTheme.bodyText2.color.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Theme.of(context).textTheme.bodyText2.color.withOpacity(0.4),
        ),
      ],
    );
  }
}
