import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  final barrierWidth;
  final barrierHeight;
  final barrierX;
  final bool isthisbotbar;

  MyBarrier({
    this.barrierHeight,
    this.barrierWidth,
    required this.isthisbotbar,
    this.barrierX,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2*barrierX+barrierWidth)/(2-barrierWidth),
      isthisbotbar?1:-1),
      child: Container(
        color:Colors.lightGreen,
        width: MediaQuery.of(context).size.width * barrierWidth /2,
        height: MediaQuery.of(context).size.height *3/4 * barrierHeight /2,
      ),
    );
  }
}