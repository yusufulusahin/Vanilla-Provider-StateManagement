import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:statemanagment_learn/future/onboard/onboard_model_view.dart';

class TabSelectIndicator extends StatefulWidget {
  const TabSelectIndicator({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  State<TabSelectIndicator> createState() => _TabSelectIndicatorState();
}

class _TabSelectIndicatorState extends State<TabSelectIndicator>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void didUpdateWidget(covariant TabSelectIndicator oldWidget) {
    //üstten alttaki bir companenti değişmek istersek
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.animateTo(widget.selectedIndex);
    }
  }

  @override
  void initState() {
    _tabController =
        TabController(length: OnBoardModels.onBoardItems.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(color: Colors.red, controller: _tabController);
  }
}
