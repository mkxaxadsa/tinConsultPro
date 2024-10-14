import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/others/divider_widget.dart';
import '../../../core/widgets/texts/text_r.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35 + getStatusBar(context)),
        const Center(child: TextR('Settings', fontSize: 24)),
        const SizedBox(height: 25),
        const DividerWidget(),
        const SizedBox(height: 46),
        _Button(
          id: 1,
          title: 'Share with friends',
          onPressed: () => _shareApp(), // Share action
        ),
        const SizedBox(height: 16),
        _Button(
          id: 2,
          title: 'Privacy Policy',
          onPressed: () => _openUrl(
              'https://docs.google.com/document/d/1uZE_leiSkQq2MkNTplFlRHyKZguXRPcIRVzah0OgTLo/edit?usp=sharing'),
        ),
        const SizedBox(height: 16),
        _Button(
          id: 3,
          title: 'Support page',
          onPressed: () => _openUrl('https://forms.gle/PRNxXj4nxybV9CGK8'),
        ),
        const SizedBox(height: 16),
        _Button(
          id: 4,
          title: 'Terms of use',
          onPressed: () => _openUrl(
              'https://docs.google.com/document/d/1D4i9JOxWqiO5_kLk7HiU6RuVdDDF5Z8XehWBHSWMSZg/edit?usp=sharing'),
        ),
      ],
    );
  }

  void _shareApp() {
    Share.share(
      'Check out this financial consultant in AppStore!',
      subject: 'Download Tin Consult Pro!',
    );
  }

  void _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.title,
    required this.onPressed,
  });

  final int id;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CuperButton(
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(
              width: 54,
              child: SvgPicture.asset('assets/s$id.svg'),
            ),
            TextR(
              title,
              fontSize: 16,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
