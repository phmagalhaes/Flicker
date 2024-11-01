import 'dart:async';
import 'package:flicker/shared/style.dart';
import 'package:flutter/material.dart';

class SplashScreenGeral extends StatefulWidget {
  const SplashScreenGeral({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenGeralState createState() => _SplashScreenGeralState();
}

class _SplashScreenGeralState extends State<SplashScreenGeral>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controllerRL;
  late AnimationController _controllerBR;
  late Animation<Offset> _animation;
  late Animation<Offset> _animationRL;
  late Animation<Offset> _animationBR;
  late AnimationController _controllerTX;
  late AnimationController _controllerFlicker;
  late Animation<Offset> _animationFlicker;
  String displayText = '';
  final String fullText = 'FLICKER';
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _controllerTX = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );


    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _controllerRL = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _controllerBR = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2700),
    );

    _controllerFlicker = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 4.0),
      end: const Offset(1.0, 1.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _animationRL = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(-1.0, -1.0),
    ).animate(CurvedAnimation(
      parent: _controllerRL,
      curve: Curves.easeInOut,
    ));

    _animationBR = Tween<Offset>(
      begin: const Offset(-1.0, -1.1),
      end: const Offset(1.0, -1.1),
    ).animate(CurvedAnimation(
      parent: _controllerBR,
      curve: Curves.easeInOut,
    ));

    _controller.forward().then((_) {
      _controllerRL.forward().then((_) {
        Future.delayed(const Duration(milliseconds: 900), () {        
          _startTypingEffect();
        });
        _controllerBR.forward().then((_) {
          Future.delayed(const Duration(milliseconds: 700), () {
            _moveFlickerTextUp();
          });
        });
      });
    });

    _animationFlicker = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.1, -3.4),
    ).animate(CurvedAnimation(
      parent: _controllerFlicker,
      curve: Curves.easeInOut,
    ));
  }

  void _moveFlickerTextUp() {
    _controllerFlicker.forward().then((_) {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }
  void _startTypingEffect() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (displayText.length < fullText.length) {
        setState(() {
          displayText += fullText[displayText.length];
        });
      } else {
        timer.cancel();
        _controllerTX.forward();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controllerRL.dispose();
    _controllerBR.dispose();
    _controllerFlicker.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.5, 1],
            colors: [
              MyColors.azulTopGratiente,
              MyColors.azulMeioGratiente,
              MyColors.azulBottomGratiente,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _animation,
              child: Image.asset(
                'assets/passaroVoa.png',
                height: 150,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Transform.translate(
                offset: const Offset(110.0, 155.0),
                child: SlideTransition(
                  position: _animationFlicker, // Animação do texto FLICKER
                  child: Text(
                    displayText,
                    style: const TextStyle(
                      fontFamily: 'BreeSerif',
                      color: Colors.white,
                      fontSize: 45,
                      shadows: [
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          color: Color.fromARGB(78, 255, 255, 255),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: _animationRL,
              child: Image.asset(
                'assets/passaroVoa2.png',
                height: 250,
              ),
            ),
            SlideTransition(
              position: _animationBR,
              child: Image.asset(
                'assets/passaroVoa.png',
                height: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
