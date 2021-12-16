import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  final Color color;
  final Widget? child;
  final int counter;

  const ColoredContainer(
      {Key? key, required this.color, this.child, required this.counter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: color,
          margin: EdgeInsets.all(20),
          child: child,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 24, left: 24),
              child: Text(counter.toString()),
            )),
      ],
    );
  }
}
