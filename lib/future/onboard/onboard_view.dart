import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statemanagment_learn/future/onboard/OnBoardCard.dart';
import 'package:statemanagment_learn/future/onboard/onBoard_Tabindicator.dart';
import 'package:statemanagment_learn/future/onboard/onboard_model_view.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTitle = 'Skip';
  bool get _isLastPage =>
      OnBoardModels.onBoardItems.length - 1 == _selectedindex;
  bool get _isFirsPage => _selectedindex == 0;

  int _selectedindex = 0;
  final String _start = 'Start';
  final String _next = 'Next';

  @override
  void initState() {
    super.initState();
  }

  void _incrementindex([int? value]) {
    print(value);
    setState(() {
      _selectedindex = value ?? _selectedindex++;
    });
  }

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      return;
    }
    _incrementindex(value);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(decoration: _backdecoration()),
        //stack'te alta yazdığın en üstte olur.
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _appBar(),
          body: Column(
            children: [
              Expanded(flex: 5, child: _pageViewBuilder()),
              const Expanded(flex: 1, child: SizedBox()),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TabSelectIndicator(selectedIndex: _selectedindex),
                    _floatingActionButton()
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: _isFirsPage
            ? null
            : IconButton(
                onPressed: () {}, icon: const Icon(Icons.chevron_left)),
        actions: [TextButton(onPressed: () {}, child: Text(_skipTitle))]);
  }

  BoxDecoration _backdecoration() {
    return const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/images3.jpeg')));
  }

  PageView _pageViewBuilder() {
    return PageView.builder(
      onPageChanged: (value) {
        _incrementAndChange(value);
      },
      itemCount: OnBoardModels.onBoardItems.length,
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      child: Text(_isLastPage ? _start : _next),
      onPressed: () {
        _incrementAndChange();
      },
    );
  }
}
