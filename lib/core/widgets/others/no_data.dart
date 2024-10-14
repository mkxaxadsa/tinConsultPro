import 'package:flutter/material.dart';

import '../texts/text_r.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: TextB(
          'No data',
          fontSize: 14,
        ),
      ),
    );
  }
}
