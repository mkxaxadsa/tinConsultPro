import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/others/divider_widget.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../widgets/day_chart.dart';
import '../widgets/month_chart.dart';
import '../widgets/week_chart.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  int index = 1;

  void changeTab(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35 + getStatusBar(context)),
        const Center(child: TextR('Activities', fontSize: 24)),
        const SizedBox(height: 25),
        const DividerWidget(),
        const SizedBox(height: 25),
        Row(
          children: [
            const SizedBox(width: 30),
            _TabButon(
              index: 1,
              title: 'Day',
              active: index == 1,
              onPressed: changeTab,
            ),
            const SizedBox(width: 7),
            _TabButon(
              index: 2,
              title: 'Week',
              active: index == 2,
              onPressed: changeTab,
            ),
            const SizedBox(width: 7),
            _TabButon(
              index: 3,
              title: 'Month',
              active: index == 3,
              onPressed: changeTab,
            ),
            const SizedBox(width: 30),
          ],
        ),
        const Spacer(),
        if (index == 1)
          const DayChart()
        else if (index == 2)
          const WeekChart()
        else
          const MonthChart(),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 15),
            const TextB(
              'Income',
              fontSize: 11,
              color: Color(0xff505050),
            ),
            const SizedBox(width: 42),
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.black,
              ),
            ),
            const SizedBox(width: 15),
            const TextB(
              'Expense',
              fontSize: 11,
              color: Color(0xff505050),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const SizedBox(width: 30),
            SvgPicture.asset(
              'assets/income.svg',
              color: AppColors.black,
            ),
            const SizedBox(width: 30),
            const TextR('Income', fontSize: 18),
            const Spacer(),
            TextR('\$$totalIncomes', fontSize: 18),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 5),
        SvgPicture.asset(
          'assets/line.svg',
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const SizedBox(width: 30),
            SvgPicture.asset(
              'assets/income.svg',
              color: AppColors.black,
            ),
            const SizedBox(width: 30),
            const TextR('Expense', fontSize: 18),
            const Spacer(),
            TextR('\$$totalExpense', fontSize: 18),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 5),
        SvgPicture.asset(
          'assets/line.svg',
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const SizedBox(width: 30),
            SvgPicture.asset(
              'assets/income.svg',
              color: AppColors.black,
            ),
            const SizedBox(width: 4),
            SvgPicture.asset(
              'assets/expense.svg',
              color: AppColors.black,
            ),
            const SizedBox(width: 6),
            const TextR('Total', fontSize: 18),
            const Spacer(),
            TextR('\$${totalIncomes + totalExpense}', fontSize: 18),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 5),
        SvgPicture.asset(
          'assets/line.svg',
          fit: BoxFit.cover,
        ),
        const Spacer(),
      ],
    );
  }
}

class _TabButon extends StatelessWidget {
  const _TabButon({
    required this.index,
    required this.title,
    required this.active,
    required this.onPressed,
  });

  final int index;
  final String title;
  final bool active;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(7),
          border: active
              ? Border.all(
                  width: 1,
                  color: AppColors.black,
                )
              : null,
        ),
        child: CuperButton(
          onPressed: () {
            onPressed(index);
          },
          child: Center(
            child: TextR(
              title,
              fontSize: 16,
              color: active ? const Color(0xff5B4D00) : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
