import 'dart:async';
import 'package:carol_str/pages/login.dart';
import 'package:carol_str/pages/style.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _moveUpAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 4), 
      vsync: this,
    );

    _scaleAnimation =
        Tween<double>(begin: 0.5, end: 1.5).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5,
          curve: Curves.easeInOut), 
    ));

    _moveUpAnimation =
        Tween<double>(begin: 0, end: -200).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0,
          curve: Curves.easeInOut),
    ));

    _controller.forward();

    Timer(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.azul,
              MyColors.azulescuro,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _moveUpAnimation.value),
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: child,
                ),
              );
            },
            child: Image.asset(
              'assets/img/logo.png',
              height: 250,
              width: 250,
            ),
          ),
        ),
      ),
    );
  }
}
