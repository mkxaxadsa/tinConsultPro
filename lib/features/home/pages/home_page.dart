import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../../activities/pages/activities_page.dart';
import '../../question/pages/question_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'main_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 95),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeSettings) return const SettingsPage();

                if (state is HomeQuestion) return const QuestionPage();

                if (state is HomeActivities) return const ActivitiesPage();

                return const MainPage();
              },
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
