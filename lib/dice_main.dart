import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_portfolio/diceset.dart';

class MyDice extends StatefulWidget {
  const MyDice({super.key});

  @override
  State<MyDice> createState() => _MyDiceState();
}

class _MyDiceState extends State<MyDice> {
  Dice dice = Dice(size: 100);
  late Timer timer;
  dynamic resultNum = 0;
  String resultView = '';
  bool isStart = false;

  void start() {
    if (!isStart && dice.dice.isNotEmpty) {
      timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        dice.shake();
        setState(() {
          resultNum = dice.dice[0];
          isStart = true;
        });
      });
    }
  }

  void pickup() {
    if (dice.dice.isNotEmpty && isStart) {
      setState(() {
        //resultView = resultView + ' ' + dice.pick().toString();
        resultView = '$resultView ${dice.pick()}';
      });
      if (dice.dice.isEmpty) {
        //클래스이름. 안에 변수 이름
        timer.cancel();
        setState(() {
          isStart = false;
          resultNum = '끝!';
        });
      }
    }
  }

  void reset() {
    setState(() {
      resultNum = '';
      resultView = '';
      dice.init();
      if (isStart) {
        timer.cancel();
      }
      isStart = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Center(
              child: Text(
                '$resultNum',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Text(
                resultView,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      iconSize: 100,
                      onPressed: start,
                      icon: const Icon(
                        Icons.play_circle_fill_rounded,
                      )),
                  IconButton(
                      iconSize: 100,
                      onPressed: pickup,
                      icon: const Icon(
                        Icons.check_box_rounded,
                      )),
                  IconButton(
                      iconSize: 100,
                      onPressed: reset,
                      icon: const Icon(
                        Icons.settings_backup_restore_rounded,
                      )),
                ],
              ))
        ],
      )),
    );
  }
}
