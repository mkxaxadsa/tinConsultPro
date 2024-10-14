import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/db/db.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/texts/text_r.dart';

class MonthChart extends StatefulWidget {
  const MonthChart({super.key});

  @override
  State<MonthChart> createState() => _MonthChartState();
}

class _MonthChartState extends State<MonthChart> {
  List<int> weeklyExpenses = [0, 0, 0, 0];
  List<int> weeklyIncomes = [0, 0, 0, 0];
  List<int> normalizedIncomes = [0, 0, 0, 0];
  List<int> normalizedExpenses = [0, 0, 0, 0];

  void getWeeklyMoney() {
    DateTime today = DateTime.now();
    int currentMonth = today.month;

    for (Money money in DB.moneyList) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);
      if (date.year == today.year && date.month == currentMonth) {
        int weekOfMonth = (date.day - 1) ~/ 7;
        if (money.expense) {
          weeklyExpenses[weekOfMonth] += money.amount;
        } else {
          weeklyIncomes[weekOfMonth] += money.amount;
        }
      }
    }

    int maxWeekly = 0;
    for (int i = 0; i < 4; i++) {
      maxWeekly = max(maxWeekly, max(weeklyIncomes[i], weeklyExpenses[i]));
    }

    for (int i = 0; i < 4; i++) {
      if (maxWeekly > 0) {
        normalizedIncomes[i] = ((weeklyIncomes[i] / maxWeekly) * 104).round();
        normalizedExpenses[i] = ((weeklyExpenses[i] / maxWeekly) * 104).round();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getWeeklyMoney();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 285,
        width: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: AppColors.white),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 104,
                  minY: -104,
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  barTouchData: BarTouchData(enabled: false),
                  barGroups: List.generate(4, (index) {
                    return BarChartGroupData(
                      x: index,
                      barsSpace: -17,
                      barRods: [
                        BarChartRodData(
                          toY: 104,
                          width: 17,
                          color: const Color(0xFFCDCDCD).withOpacity(0.36),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        BarChartRodData(
                          toY: normalizedIncomes[index].toDouble(),
                          width: 17,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        BarChartRodData(
                          toY: -104,
                          width: 17,
                          color: const Color(0xFFCDCDCD).withOpacity(0.36),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        BarChartRodData(
                          toY: -normalizedExpenses[index].toDouble(),
                          width: 17,
                          color: const Color(0xFF1F1F1F),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ],
                    );
                  }),
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextB(
                  'W1',
                  fontSize: 11,
                  color: Color(0xff505050),
                ),
                TextB(
                  'W2',
                  fontSize: 11,
                  color: Color(0xff505050),
                ),
                TextB(
                  'W3',
                  fontSize: 11,
                  color: Color(0xff505050),
                ),
                TextB(
                  'W4',
                  fontSize: 11,
                  color: Color(0xff505050),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
