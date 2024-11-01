// ignore: file_names
import 'package:flicker/shared/style.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String displayText = '';
  final String fullText = 'FLICKER';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (displayText.length < fullText.length) {
        setState(() {
          displayText += fullText[displayText.length];
        });
      } else {
        timer.cancel();
      }
    });

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0,
                0.5,
                1
              ],
              colors: [
                MyColors.azulTopGratiente,
                MyColors.azulMeioGratiente,
                MyColors.azulBottomGratiente,
              ]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeTransition(
              opacity: _animation,
              child: Image.asset('assets/passaro.png', height: 150),
            ),
            Transform.translate(
              offset: const Offset(-50, 0),
              child: FadeTransition(
                opacity: _animation,
                child: Text(
                  displayText,
                  style: const TextStyle(
                    fontFamily: 'BreeSerif',
                    color: Colors.white,
                    fontSize: 55,
                    shadows: [
                      Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          color: Color.fromARGB(68, 255, 255, 255)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
