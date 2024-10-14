import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/db/db.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/texts/text_r.dart';

class WeekChart extends StatefulWidget {
  const WeekChart({super.key});

  @override
  State<WeekChart> createState() => _WeekChartState();
}

class _WeekChartState extends State<WeekChart> {
  int expenses = 0;
  int incomes = 0;
  List<int> weeklyExpenses = List.filled(7, 0);
  List<int> weeklyIncomes = List.filled(7, 0);

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
  }

  void getWeeklyMoney() {
    DateTime today = DateTime.now();
    DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    for (Money money in DB.moneyList) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);
      if (date.isAfter(startOfWeek) &&
          date.isBefore(startOfWeek.add(const Duration(days: 7)))) {
        if (money.expense) {
          weeklyExpenses[date.weekday - 1] += money.amount;
        } else {
          weeklyIncomes[date.weekday - 1] += money.amount;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getTodaysMoney();
    getWeeklyMoney();
  }

  @override
  Widget build(BuildContext context) {
    int maxWeekly = (weeklyIncomes.reduce((a, b) => a > b ? a : b) >
            weeklyExpenses.reduce((a, b) => a > b ? a : b))
        ? weeklyIncomes.reduce((a, b) => a > b ? a : b)
        : weeklyExpenses.reduce((a, b) => a > b ? a : b);

    List<double> normalizedWeeklyIncomes = weeklyIncomes
        .map((e) => (maxWeekly > 0 ? (e / maxWeekly) * 104 : 0).toDouble())
        .toList();
    List<double> normalizedWeeklyExpenses = weeklyExpenses
        .map((e) => (maxWeekly > 0 ? (e / maxWeekly) * 104 : 0).toDouble())
        .toList();

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
                  barGroups: List.generate(7, (index) {
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
                          toY: normalizedWeeklyIncomes[index],
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
                          toY: -normalizedWeeklyExpenses[index],
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
                  'Mon',
                  fontSize: 11,
                  color: Color(0xff505050),
                ),
                TextB(
                  'Tue',
                  fontSize: 11,
                  color: Color(0xff505050),
                ),
                TextB(
                  'Wed',
                  fontSize: 11,
                  color: Color(0xff505050),
                ),
                TextB(
                  'Thu',
                  fontSize: 11,
                  color: Color(0xff505050),
                ),
                TextB(
                  'Fri',
                  fontSize: 11,
                  color: Color(0xff505050),
                ),
                TextB(
                  'Sat',
                  fontSize: 11,
                  color: Color(0xff505050),
                ),
                TextB(
                  'Sun',
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
