import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statemanagment_learn/future/onboard/OnBoardCard.dart';
import 'package:statemanagment_learn/future/onboard/onBoard_Tabindicator.dart';
import 'package:statemanagment_learn/future/onboard/onboard_model_view.dart';
import 'package:statemanagment_learn/future/onboard/startFabButton.dart';

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
  ValueNotifier<bool> isBackEnable = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  void incrementindex([int? value]) {
    print(value);
    setState(() {
      if (value != null) {
        _selectedindex = value;
      } else {
        _selectedindex++;
      }
    });
  }

  void changeBackEnable(bool value) {
    if (value == isBackEnable.value) {
      return;
    }

    isBackEnable.value = !value;
  }

  void incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      changeBackEnable(true);
      return;
    }

    changeBackEnable(false);
    incrementindex(value);
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
                    StartFaButton(
                      isLastPage: _isLastPage,
                      onpressed: () {
                        incrementAndChange();
                        print('object');
                      },
                    )
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
        actions: [
          ValueListenableBuilder(
            valueListenable: isBackEnable,
            builder: (context, value, child) {
              return TextButton(onPressed: () {}, child: Text(_skipTitle));
            },
          )
        ]);
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
        incrementAndChange(value);
      },
      itemCount: OnBoardModels.onBoardItems.length,
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }
}
