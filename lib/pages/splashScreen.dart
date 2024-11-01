import 'package:camilly_str/pages/login.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Incio extends StatefulWidget {
  const Incio({super.key});

  @override
  _IncioState createState() => _IncioState();
}

class _IncioState extends State<Incio> with SingleTickerProviderStateMixin {
  String _text = '';
  final String _fullText = "FLICKER";
  int _index = 0;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -1), 
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _startImageDelay();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startImageDelay() {
    Future.delayed(Duration(milliseconds: 500), () {
      _startTypingAnimation(); 
    });
  }

  void _startTypingAnimation() {
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (_index < _fullText.length) {
        setState(() {
          _text += _fullText[_index];
          _index++;
        });
      } else {
        timer.cancel();
        _controller.forward().then((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.azulClaro,
              MyColors.azul,
              MyColors.azulEscuro,
            ],
          ),
        ),
        child: SlideTransition(
          position: _animation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              ClipRRect(
              child: Image.asset(
                "assets/img/passaro.png", 
                width: 100, 
                height: 100, 
                fit: BoxFit.contain,
              ),
              ),
              Text(
                _text,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "BreeSerif",
                  shadows: [
                    Shadow(
                      offset: Offset(3.0, 4.0),
                      color: Color.fromARGB(255, 44, 41, 41),
                      blurRadius: 15.0,
                    )
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}