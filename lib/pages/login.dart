import 'package:camilly_str/pages/esqueceuSenha.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [MyColors.azulClaro, MyColors.azul, MyColors.azulEscuro]),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.04), 
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.1), // Tamanho responsivo
                Image.asset(
                  'assets/img/flicker.png',
                  width: size.width * 0.8, // Tamanho responsivo da imagem
                ),
                SizedBox(height: size.height * 0.04),
                const Text(
                  "Faça login com sua conta do Flicker",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1.5, 2.5),
                          color: Color.fromARGB(255, 66, 62, 62),
                          blurRadius: 3.0,
                        )
                      ]),
                ),
                SizedBox(height: size.height * 0.06),
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
                            )
                          ]),
                    ),
                    SizedBox(
                      width: size.width * 0.9, 
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Digite seu email",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 27, 95, 179)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 121, 176, 242),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 121, 176, 242)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 121, 176, 242),
                                width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15),
                        ),
                        validator: (String? email) {
                          if (email == "" || email == null) {
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
                              color: MyColors.azul,
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
                          fillColor: const Color.fromARGB(255, 121, 176, 242),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 121, 176, 242)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
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
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EsqueceuSenha()),
                        );
                      },
                      child: const Text(
                        "Esqueceu a Senha?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 40,
                      // width: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          buttonEnterClick();
                        },
                        child: const Text(
                          "Entrar",
                          style: TextStyle(
                              fontSize: 16, 
                              fontWeight: FontWeight.bold),
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
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Não tem uma conta?",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        shadows: [
                          Shadow(
                            offset: Offset(0.1, 0.1),
                            blurRadius: 4.0,
                            color: Color.fromARGB(255, 34, 34, 34),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cadastro()),
                        );
                      },
                      child: const Text(
                        "Cadastre-se",
                        style: TextStyle(
                            color: Color.fromARGB(255, 121, 176, 242),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            shadows: [
                              Shadow(
                                  offset: Offset(1.0, 1.5),
                                  blurRadius: 4.0,
                                  color: Color.fromARGB(255, 66, 62, 62)),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } else {
      print("form errado");
    }
  }
}
