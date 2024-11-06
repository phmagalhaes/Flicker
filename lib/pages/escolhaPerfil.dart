import 'package:carol_str/pages/style.dart';
import 'package:flutter/material.dart';

class Escolhaperfil extends StatefulWidget {
  const Escolhaperfil({super.key});

  @override
  State<Escolhaperfil> createState() => _EscolhaperfilState();
}

class _EscolhaperfilState extends State<Escolhaperfil> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 27, 95, 176), // Definido como fallback
        // appBar: AppBar(
        //   backgroundColor: const Color.fromARGB(255, 27, 95, 176),
        //   title: const Text("escolha perfil"),
        //   foregroundColor: Colors.white,
        // ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [MyColors.azul],
              ),
            ),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      // key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                const Text(
                                  'Voltar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1.0, 3.5),
                                        color: Colors.black38,
                                        blurRadius: 3.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text("slaa"),
                            Image.asset("assets/img/stitch.png")
                          ]),
                    )))));
  }
}
