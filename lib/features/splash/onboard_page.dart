import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/db/prefs.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/texts/text_r.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int pageIndex = 1;

  void onNext() async {
    if (pageIndex == 2) {
      await saveOnboard().then((_) {
        if (mounted) {
          context.go('/home');
        }
      });
    } else {
      setState(() {
        pageIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(flex: 5),
              TextB(
                pageIndex == 1
                    ? 'In one application\neverything you\nneed to manage\nyour finances'
                    : 'Your personal\nfinancial adviser is\nalways with you',
                fontSize: 32,
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SvgPicture.asset('assets/onboard$pageIndex.svg'),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                white: true,
                onPressed: onNext,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 164,
                child: TextR(
                  pageIndex == 1
                      ? 'Plan your budget, control your income and expenses, track changes in exchange rates and cryptocurrencies and receive notifications about exchange rates and their changes.'
                      : 'This mobile application will allow you to quickly and effectively manage your personal finances.',
                  fontSize: 16,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
