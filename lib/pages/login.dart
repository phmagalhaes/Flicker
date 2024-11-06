import 'package:carol_str/pages/esqueceuSenha.dart';
import 'package:carol_str/pages/style.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'cadastro.dart';

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
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [MyColors.azul, MyColors.azulescuro, MyColors.azulfinal],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // Logotipo no topo
                Image.asset(
                  "assets/img/logo.png",
                ),
                const SizedBox(height: 40),

                // Título "Faça login com sua conta do Flicker"
                const Text(
                  "Faça login com sua conta do Flicker",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 60),

                // Campo de Email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "E-mail",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          hintStyle: const TextStyle(color: MyColors.azulescuro),
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Campo de Senha
                    Text(
                      "Senha",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          hintStyle: const TextStyle(color: MyColors.azulescuro),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: MyColors.azulescuro,
                            ),
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
                        ),
                        obscureText: !_showPassword,
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Botão de login
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
                
                // Adiciona um Spacer para empurrar o conteúdo abaixo para o final da tela
                const Spacer(),

                // Texto "Não tem uma conta? Cadastre-se"
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Não tem uma conta?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cadastro()),
                        );
                      },
                      child: const Text(
                        "Cadastre-se",
                        style: TextStyle(
                          color: Color.fromARGB(255, 121, 176, 242),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
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
      print("Erro no formulário");
    }
  }
}
