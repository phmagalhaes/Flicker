import 'package:camilly_str/pages/escolhaPerfil.dart';
import 'package:camilly_str/pages/login.dart';
import 'package:camilly_str/pages/selecaoPerfil.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';

class Adicionarperfil extends StatefulWidget {
  const Adicionarperfil({super.key});

  @override
  State<Adicionarperfil> createState() => _AdicionarperfilState();
}

class _AdicionarperfilState extends State<Adicionarperfil> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 27, 95, 176), // Definido como fallback
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 27, 95, 176),
      //   title: const Text("adicionar perfil"),
      //   foregroundColor: Colors.white,
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.azulClaro, MyColors.azul, MyColors.azulEscuro
            ],
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
                  SizedBox(height: 20,),
                  Text(
                    "Adicionar Perfil",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(1.0, 3.5),
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 3.0,
                          )
                        ]),
                  ),
                  SizedBox(height: 20,),
                  Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('assets/img/stitch.png',
                                  width:
                                      120, 
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: -10,
                                  right: -10,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>Escolhaperfil()), 
                                      );
                                    },
                                    child: Image.asset('assets/img/editor.png',
                                      width:
                                          50, 
                                      height: 50,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  SizedBox(height: 50,),
                            SizedBox(
                              width: 350,
                              child: TextFormField(
                                autofocus: true,
                                decoration: InputDecoration(
                                    hintText: "Digite o nome do perfil",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 27, 95, 179)),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 121, 176, 242),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 121, 176, 242)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 121, 176, 242),
                                          width: 2),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15)),
                                validator: (String? email) {
                                  if (email == "" || email == null) {
                                    return "O nome não pode estar vazio";
                                  }
                                  if (email.length < 6) {
                                    return "O nome está muito curto";
                                  }
                                  if (!email.contains("@")) {
                                    return "O nome é inválido";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          SizedBox(height: 370,),
                           GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Selecaoperfil()),
                                );
                              },
                              child: const Text(
                                "Salvar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ]
                  ),
              )
            )
          )
        
      )
    );
  }
}