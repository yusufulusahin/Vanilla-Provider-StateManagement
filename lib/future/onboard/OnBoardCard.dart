import 'package:flutter/material.dart';
import 'package:statemanagment_learn/future/onboard/onboard_model_view.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({super.key, required this.model});
  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Container(
          height: 500,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(model.imageWithPath))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 215, 132, 7)),
                    model.title),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 215, 132, 7)),
                    model.title2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
