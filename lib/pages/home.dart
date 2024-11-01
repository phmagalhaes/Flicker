import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 176), // Definido como fallback
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 95, 176),
        title: const Text("Home"),
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        
      )
    );
  }
}