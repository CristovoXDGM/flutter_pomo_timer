import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomo_timer/widgets/atoms/personalized_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double secondsAmount = 25 * 60;

  late double currentMinutes = secondsAmount / 60;
  late double currentsec = secondsAmount % 60;
  late Timer _timer;

  bool countdownStarted = false;

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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ClipOval(
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    color: currentTheme.colorScheme.secondary,
                    child: Text(
                      "${currentMinutes.floor().toString().padLeft(2, "0")}:${currentsec.floor().toString().padLeft(2, "0")}",
                      style: TextStyle(
                        fontSize: 30,
                        color: currentTheme.colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PersonalizedButton(
                    buttonIcon: Icons.play_arrow,
                    onPress: startCountdown,
                    buttonColorPressed: currentTheme.colorScheme.tertiary,
                    buttonColorHovered: currentTheme.colorScheme.primary,
                    buttonColorActive: currentTheme.colorScheme.secondary,
                  ),
                  currentMinutes < 25
                      ? PersonalizedButton(
                          buttonIcon: Icons.stop,
                          onPress: () {
                            resetTimer();
                          },
                          buttonColorHovered: currentTheme.colorScheme.primary,
                          buttonColorPressed: Colors.red.shade400,
                          buttonColorActive: currentTheme.colorScheme.error,
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
