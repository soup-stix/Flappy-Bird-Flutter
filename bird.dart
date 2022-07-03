import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

class MyBird extends StatelessWidget{
  final birdy;
  final double birdWidth;
  final double birdHeight;

  MyBird({this.birdy, required this.birdWidth, required this.birdHeight});
  //MyBird({this.birdy});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, (2*birdy+birdHeight)/(2-birdHeight)),
        child: Image.asset(
            "assets/bird.png",
          width: MediaQuery.of(context).size.height*birdWidth/2,
          height: MediaQuery.of(context).size.height*3/4*birdHeight/2,
          fit: BoxFit.fill,
        )

      );

  }
}