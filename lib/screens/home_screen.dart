import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalPomodoro = 2500;
  bool isPlaying = false;
  late Timer timer;

  void startPomodoro(Timer timer) {
    setState(() {
      totalPomodoro--;
    });
  }

  void _toggleTimer() {
    if (!isPlaying) {
      timer = Timer.periodic(const Duration(seconds: 1), startPomodoro);
    }
    if (isPlaying) {
      timer.cancel();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    String minutes = '${totalPomodoro ~/ 60}'.padLeft(2, '0');
    String seconds = '${totalPomodoro % 60}'.padLeft(2, '0');

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '$minutes:$seconds',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            child: Center(
              child: IconButton(
                iconSize: 125,
                color: Theme.of(context).cardColor,
                icon: Icon(
                    isPlaying ? Icons.pause_circle_outline : Icons.play_circle),
                onPressed: _toggleTimer,
              ),
            ),
          ),
          Flexible(
            child: Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '뽀모도로',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.displayLarge?.color,
                      ),
                    ),
                    Text(
                      "0",
                      style: TextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.displayLarge?.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
