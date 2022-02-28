import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomo_timer/widgets/atoms/personalized_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool startClock = false;

  double secondsAmount = 25 * 60;

  late double currentMinutes = secondsAmount / 60;
  late double currentsec = secondsAmount % 60;
  late Timer _timer;

  updateTimer() {
    setState(() {
      currentMinutes = secondsAmount / 60;
      currentsec = secondsAmount % 60;
    });
  }

  resetTimer() {
    setState(() {
      _timer.cancel();
      secondsAmount = 25 * 60;
      updateTimer();
    });
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (secondsAmount == 0) {
        resetTimer();
      } else {
        setState(() {
          secondsAmount--;
          updateTimer();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentTheme = Theme.of(context);

    return Scaffold(
      backgroundColor: currentTheme.colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "${currentMinutes.floor().toString().padLeft(2, "0")}:${currentsec.floor().toString().padLeft(2, "0")}",
              style: TextStyle(
                fontSize: 30,
                color: currentTheme.colorScheme.tertiary,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PersonalizedButton(
                buttonText: "start",
                onPress: startCountdown,
                buttonColor: currentTheme.colorScheme.secondary,
              ),
              PersonalizedButton(
                buttonText: "Cancel",
                onPress: () {
                  resetTimer();
                },
                buttonColor: currentTheme.colorScheme.error,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
