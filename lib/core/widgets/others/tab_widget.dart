import 'package:flutter/material.dart';

import '../../utils.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    super.key,
    required this.first,
    required this.second,
    required this.title1,
    required this.title2,
  });

  final Widget first;
  final Widget second;
  final String title1;
  final String title2;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20 + getStatusBar(context)),
        Container(
          height: 45,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.greenAccent,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: widget.title1),
              Tab(text: widget.title2),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              widget.first,
              widget.second,
            ],
          ),
        ),
      ],
    );
  }
}
