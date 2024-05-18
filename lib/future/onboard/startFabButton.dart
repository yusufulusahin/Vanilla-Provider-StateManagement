import 'package:flutter/material.dart';

class StartFaButton extends StatelessWidget {
  const StartFaButton({super.key, required this.isLastPage, this.onpressed});

  final bool isLastPage;
  final VoidCallback? onpressed;

  final String _start = 'Start';
  final String _next = 'Next';

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text(isLastPage ? _start : _next),
      onPressed: () {
        onpressed;
      },
    );

    ;
  }
}
