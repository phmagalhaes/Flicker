import 'package:camilly_str/pages/login.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(FlickerApp());
}

class FlickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlickerScreen(),
      routes: {
        '/login': (context) => Login(), 
      },
    );
  }
}

class FlickerScreen extends StatefulWidget {
  @override
  _FlickerScreenState createState() => _FlickerScreenState();
}

class _FlickerScreenState extends State<FlickerScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _birdAnimation;
  late Animation<double> _textOpacityAnimation;

  

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.forward();

      Future.delayed(Duration(seconds: 5), () {
        Navigator.pushReplacementNamed(context, '/login');
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    _birdAnimation = Tween<double>(begin: -200, end: screenWidth).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _textOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.4, 1.0, curve: Curves.easeIn),
    ));

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
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
          ),
          Center(
            child: AnimatedBuilder(
              animation: _textOpacityAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: Text(
                    'FLICKER',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "BreeSerif",
                      shadows: [
                    Shadow(
                      offset: Offset(3.0, 4.0),
                      color: Color.fromARGB(255, 44, 41, 41),
                      blurRadius: 15.0,
                    )
                  ],
                      letterSpacing: 2,
                    ),
                  ),
                );
              },
            ),
          ),
          AnimatedBuilder(
            animation: _birdAnimation,
            builder: (context, child) {
              return Positioned(
                top: screenHeight / 2 - 150,
                left: _birdAnimation.value,
                child: Image.asset(
                  'assets/img/passarinho.png', 
                  height: 300,
                  width: 300,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}