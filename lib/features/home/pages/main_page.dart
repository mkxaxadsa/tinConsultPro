import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/others/divider_widget.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../money/bloc/money_bloc.dart';
import '../../money/pages/money_add_page.dart';
import '../widgets/default_widget.dart';
import '../widgets/history_widget.dart';
import '../widgets/home_button.dart';
import '../widgets/home_title.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool history = false;

  void changeTab() {
    setState(() {
      history = !history;
    });
  }

  void onAdd(bool expense) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: const Color(0xfffef6ca),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder: (context) {
        return MoneyAddPage(expense: expense);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    checkTrackingData();
  }

  Future<void> checkTrackingData() async {
    final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    } else if (status == TrackingStatus.denied ||
        status == TrackingStatus.restricted) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35 + getStatusBar(context)),
        const HomeTitle(),
        const SizedBox(height: 18),
        BlocBuilder<MoneyBloc, MoneyState>(
          builder: (context, state) {
            return Row(
              children: [
                const SizedBox(width: 40),
                TextB('\$ ${getTotalBalance()}.', fontSize: 28),
                const TextB(
                  ' 00',
                  fontSize: 28,
                  color: Color(0xffaeaeae),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 18),
        const DividerWidget(),
        const SizedBox(height: 22),
        Row(
          children: [
            const SizedBox(width: 30),
            HomeButton(
              id: 1,
              title: 'Add income',
              onPressed: () {
                onAdd(false);
              },
            ),
            const SizedBox(width: 40),
            HomeButton(
              id: 1,
              title: 'Add expense',
              onPressed: () {
                onAdd(true);
              },
            ),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const SizedBox(width: 30),
            const Spacer(),
            const SizedBox(width: 40),
            HomeButton(
              id: 4,
              title: 'History',
              active: history,
              onPressed: changeTab,
            ),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 50),
        if (history) const HistoryWidget() else const DefaultWidget(),
      ],
    );
  }
}
