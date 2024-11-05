import 'package:flicker/shared/style.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Container(
        padding: const EdgeInsets.all(30.0),
        height: MediaQuery.of(context).size.height * 1,
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
                MyColors.azulBottomGratiente
              ]),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset('assets/logo.png'),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Faça login com sua conta do Flicker",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(69, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 5.0,
                            color: Color.fromARGB(69, 0, 0, 0),
                          ),
                        ],
                      )),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 121, 176, 242),
                    hintText: "Informe seu email",
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none, // Remove a borda padrão
                    ),
                  ),
                  style: const TextStyle(color: Color(0xFF08172B)),
                  validator: (String? email) {
                    if (email == "" || email == null) {
                      return "O email não pode ser vazio";
                    }
                    if (email.length < 6) {
                      return "O email está muito curto";
                    }
                    if (!email.contains("@")) {
                      return "O email é invalido";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Senha",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 5.0,
                            color: Color.fromARGB(69, 0, 0, 0),
                          ),
                        ],
                      )),
                ),
                TextFormField(
                  obscureText: _showPassword == false ? true : false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 121, 176, 242),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: GestureDetector(
                        child: Icon(_showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      iconColor: MyColors.azulTopGratiente,
                      hintText: "Informe sua senha"),
                  style: const TextStyle(color: Color(0xFF08172B)),
                  validator: (String? senha) {
                    if (senha == "" || senha == null) {
                      return "A senha não pode ser vazia";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        buttonEnterClick();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Entrar"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 180,
                ),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Não tem uma conta?",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          child: const Text(
                            "Cadastrar-se",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: MyColors.azulTopGratiente),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/cadastro');
                          },
                        ),
                      ]),
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
      Navigator.pushReplacementNamed(context, '/catalogo');
    } else {
      print("form erro");
    }
  }
}
