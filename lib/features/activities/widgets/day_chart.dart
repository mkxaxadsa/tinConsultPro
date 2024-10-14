import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/db/db.dart';
import '../../../core/models/money.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_r.dart';

class DayChart extends StatefulWidget {
  const DayChart({super.key});

  @override
  State<DayChart> createState() => _DayChartState();
}

class _DayChartState extends State<DayChart> {
  int expenses = 0;
  int incomes = 0;
  int normalizedIncome = 0;
  int normalizedExpense = 0;

  void getTodaysMoney() {
    DateTime today = DateTime.now();
    List<Money> todaysMoneys = [];
    for (Money money in DB.moneyList) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);
      if (date.year == today.year &&
          date.month == today.month &&
          date.day == today.day) {
        todaysMoneys.add(money);
      }
    }
    for (Money money in todaysMoneys) {
      if (money.expense) {
        expenses += money.amount;
      } else {
        incomes += money.amount;
      }
    }
    int maxValue = incomes > expenses ? incomes : expenses;
    if (maxValue == 0) {
      normalizedIncome = 0;
      normalizedExpense = 0;
    } else {
      normalizedIncome = ((incomes / maxValue) * 104).round();
      normalizedExpense = ((expenses / maxValue) * 104).round();
    }
  }

  @override
  void initState() {
    super.initState();
    getTodaysMoney();
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
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(),
                    ),
                  ),
                  barTouchData: BarTouchData(enabled: false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barsSpace: -17,
                      barRods: [
                        BarChartRodData(
                          toY: 104,
                          width: 17,
                          color: const Color(0xFFCDCDCD).withOpacity(0.36),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        BarChartRodData(
                          toY: normalizedIncome.toDouble(),
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
                          toY: -normalizedExpense.toDouble(),
                          width: 17,
                          color: const Color(0xFF1F1F1F),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ],
                    ),
                  ],
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextB(
              getWeekdayAbbreviation(),
              fontSize: 11,
              color: const Color(0xff505050),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
