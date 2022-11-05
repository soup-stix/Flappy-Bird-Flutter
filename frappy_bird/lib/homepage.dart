import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frappy_bird/bird.dart';
import 'package:frappy_bird/barrier.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key?key}):super(key:key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  static double birdy = 0;
  double inipos = birdy;
  double height = 0;
  double time = 0;
  double gravity = -4;
  double velocity = 3.0;
  double birdWidth = 0.1;
  double birdHeight = 0.1;

  bool gamehasstarted = false;

  static List<double> barrierX = [2,2+1.5,2+3,2+4.5];
  static double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [
    [0.6,0.4],
    [0.4,0.6],
    [0.8,0.2],
    [0.2,0.8],
  ];

  void startGame(){
    gamehasstarted = true;
    Timer.periodic(Duration(milliseconds: 10),(timer){
      height = gravity * time * time + velocity * time;

      setState(() {
          birdy = inipos - height;
      });


      if(birdisdead()){
        timer.cancel();
        //gamehasstarted = false;
        _showDialog();
        //resetGame();
      }

      movemap();

      time += 0.01;
    });
  }

  void movemap(){
    for(int i=0;i<barrierX.length;i++)
      {
        setState(() {
          barrierX[i] -= 0.005;
        });
        if(barrierX[i] < -1.5){
          barrierX[i] += 3;
        }
      }
  }

  void jump(){
    setState(() {
      time = 0;
      inipos = birdy;
    });
  }

  void resetGame(){
    Navigator.pop(context);
    setState(() {
      birdy = 0;
      gamehasstarted = false;
      time = 0;
      inipos = birdy;
      barrierX = [2,2+1.5,2+3,2+4.5];
    });
  }

  void _showDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: Colors.blueGrey,
            title: Center(
              child: Text("GAME OVER",
              style: TextStyle(color: Colors.white),),
            ),
            actions: [
              GestureDetector(
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color: Colors.white,
                    child: Center(
                      child: Text("PLAY AGAIN",
                      style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ),
              )
            ]
          );
        }
    );
  }

  bool birdisdead(){
    if(birdy < -1 || birdy > 1){
      return true;
    }

    for(int i=0;i<barrierX.length;i++) {
      if (barrierX[i] <= birdWidth
          && barrierX[i] + barrierWidth >= -birdWidth
          && (birdy <= -1 + barrierHeight[i][0]
              || birdy + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gamehasstarted?jump:startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey,
                child: Stack(
                  children: [
                    MyBird(
                      birdy: birdy,
                      birdHeight: birdHeight,
                      birdWidth: birdWidth,
                    ),
                    // top barrier 1
                    MyBarrier(
                      barrierX: barrierX[0],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[0][0],
                      isthisbotbar: false,
                    ),
                    MyBarrier(
                      barrierX: barrierX[0],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[0][1],
                      isthisbotbar: true,
                    ),
                    MyBarrier(
                      barrierX: barrierX[1],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[1][0],
                      isthisbotbar: false,
                    ),
                    MyBarrier(
                      barrierX: barrierX[1],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[1][1],
                      isthisbotbar: true,
                    ),
                    MyBarrier(
                      barrierX: barrierX[2],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[2][0],
                      isthisbotbar: false,
                    ),
                    MyBarrier(
                      barrierX: barrierX[2],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[2][1],
                      isthisbotbar: true,
                    ),
                    MyBarrier(
                      barrierX: barrierX[3],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[3][0],
                      isthisbotbar: false,
                    ),
                    MyBarrier(
                      barrierX: barrierX[3],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[3][1],
                      isthisbotbar: true,
                    ),
                    Container(
                      alignment: Alignment(0,-0.5),
                      child: Text(
                          gamehasstarted?'': 'TAP TO PLAY',
                          style: TextStyle(color:Colors.black, fontSize: 30),
                      )
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Center(child: Text("𝙼𝚊𝚍𝚎 𝚋𝚢: 𝙰𝚗𝚊𝚗𝚍",style: TextStyle(color:Colors.black, fontSize: 30),)),
                color: Colors.blueGrey,
              ),
            ),
          ],
        )
      ),
    );
  }
}