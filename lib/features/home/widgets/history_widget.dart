import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/widgets/others/divider_widget.dart';
import '../../../core/widgets/others/no_data.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../money/bloc/money_bloc.dart';
import 'money_card.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (context, state) {
        if (state is MoneyLoadedState) {
          if (state.money.isEmpty) {
            return const NoData();
          }

          return Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/home4.svg'),
                    const SizedBox(width: 13),
                    const TextR('History', fontSize: 18),
                  ],
                ),
                const SizedBox(height: 4),
                const DividerWidget(margin: false),
                const SizedBox(height: 22),
                ...List.generate(
                  state.money.length,
                  (index) {
                    return MoneyCard(money: state.money[index]);
                  },
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
