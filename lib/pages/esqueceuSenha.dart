import 'package:carol_str/pages/login.dart';
import 'package:carol_str/pages/style.dart';
import 'package:carol_str/pages/login.dart';
import 'package:carol_str/pages/style.dart';
import 'package:flutter/material.dart';

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({super.key});

  @override
  State<EsqueceuSenha> createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showPassword1 = false;

  @override
  Widget build(BuildContext context) {
    // Obtem o tamanho da tela
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.azul,
              MyColors.azulescuro,
              MyColors.azulfinal,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
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
                  Image.asset('assets/img/logo.png'),
                  const SizedBox(height: 20),
                  const Text(
                    "Redefinir Senha",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
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
                  const SizedBox(height: 8),
                  const Text(
                    "Digite o endereço de e-mail que você usa no Flicker para enviarmos um link de redefinição de senha.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "E-mail",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(1.5, 2.5),
                              color: Color.fromARGB(255, 66, 62, 62),
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.9,
                        child: TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "Digite seu email",
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 27, 95, 179),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242),
                                  width: 2),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                          ),
                          validator: (String? email) {
                            if (email == null || email.isEmpty) {
                              return "O e-mail não pode estar vazio";
                            }
                            if (email.length < 6) {
                              return "O e-mail está muito curto";
                            }
                            if (!email.contains("@")) {
                              return "O e-mail é inválido";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                      "Senha",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(1.5, 2.5),
                              color: Color.fromARGB(255, 66, 62, 62),
                              blurRadius: 3.0,
                            )
                          ]),
                    ),
                    SizedBox(
                      width: size.width * 0.9, 
                      child: TextFormField(
                        autofocus: true,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: MyColors.azulescuro,
                            ),
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
                          hintText: "Digite sua senha",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 27, 95, 179)),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 121, 176, 242)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 121, 176, 242),
                                width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15),
                        ),
                        validator: (String? password) {
                          if (password == "" || password == null) {
                            return "A senha não pode estar vazia";
                          }
                          if (password.length < 4) {
                            return "A senha está muito curta";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Confirmar senha",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(1.5, 2.5),
                              color: Color.fromARGB(255, 66, 62, 62),
                              blurRadius: 3.0,
                            )
                          ]),
                    ),
                    SizedBox(
                      width: size.width * 0.9, 
                      child: TextFormField(
                        autofocus: true,
                        obscureText: !_showPassword1,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _showPassword1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: MyColors.azulescuro,
                            ),
                            onTap: () {
                              setState(() {
                                _showPassword1 = !_showPassword1;
                              });
                            },
                          ),
                          hintText: "Conforme sua senha",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 27, 95, 179)),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 121, 176, 242)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 121, 176, 242),
                                width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15),
                        ),
                        validator: (String? password) {
                          if (password == "" || password == null) {
                            return "O confirmar senha não pode estar vazia";
                          }
                          if (password.length < 4) {
                            return "O confirmar senha está muito curta";
                          }
                          return null;
                        },
                      ),
                    ),
                    ],
                  ),
                 const SizedBox(height: 16),
                  Align(
                    alignment:
                        Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        buttonEnterClick();
                      },
                      child: const Text(
                        "Enviar",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 40, 112, 200),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    } else {
      print("form errado");
    }
  }
}