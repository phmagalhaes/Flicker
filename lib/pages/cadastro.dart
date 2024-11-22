import 'package:flutter/material.dart';
import 'package:projeto03_09_24/shared/style.dart';
import 'package:projeto03_09_24/pages/login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 176),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.5, 1],
            colors: [
              MyColors.azulE,
              MyColors.azulGradiente,
              MyColors.azulBottomGradiente,
            ],
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50), // Ajuste de espaçamento acima da imagem
                    Image.asset("assets/img/logo.png"),
                    const SizedBox(height: 20), // Ajuste de espaçamento abaixo da imagem
                    const Text(
                      "Cadastre-se",
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
                    const SizedBox(height: 20),

                    // Campo Nome
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nome:",
                        style: TextStyle(
                          fontSize: 15,
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
                    ),
                    TextFormField(
                      style: const TextStyle(color: Color(0xFF08172B)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 121, 176, 242),
                        hintText: "Digite seu nome completo",
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (String? nome) {
                        if (nome == null || nome.isEmpty) {
                          return "O nome não pode ser vazio";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Campo CPF
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "CPF:",
                        style: TextStyle(
                          fontSize: 15,
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
                    ),
                    TextFormField(
                      style: const TextStyle(color: Color(0xFF08172B)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 121, 176, 242),
                        hintText: "Digite seu CPF",
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (String? cpf) {
                        if (cpf == null || cpf.isEmpty) {
                          return "O CPF não pode ser vazio";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Campo Telefone
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Telefone:",
                        style: TextStyle(
                          fontSize: 15,
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
                    ),
                    TextFormField(
                      style: const TextStyle(color: Color(0xFF08172B)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 121, 176, 242),
                        hintText: "Digite seu telefone",
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (String? telefone) {
                        if (telefone == null || telefone.isEmpty) {
                          return "O telefone não pode ser vazio";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Campo E-mail
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "E-mail:",
                        style: TextStyle(
                          fontSize: 15,
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
                    ),
                    TextFormField(
                      style: const TextStyle(color: Color(0xFF08172B)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 121, 176, 242),
                        hintText: "Digite seu email",
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (String? email) {
                        if (email == null || email.isEmpty) {
                          return "O e-mail não pode ser vazio";
                        }
                        if (!email.contains("@") || email.length < 6) {
                          return "O e-mail é inválido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Campo Senha
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Senha:",
                        style: TextStyle(
                          fontSize: 15,
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
                    ),
                    TextFormField(
                      obscureText: !_showPassword,
                      style: const TextStyle(color: Color(0xFF08172B)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 121, 176, 242),
                        hintText: "Digite sua senha",
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _showPassword ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (String? senha) {
                        if (senha == null || senha.isEmpty) {
                          return "A senha não pode ser vazia";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Campo Confirmar Senha
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirme a Senha:",
                        style: TextStyle(
                          fontSize: 15,
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
                    ),
                    TextFormField(
                      obscureText: !_showConfirmPassword,
                      style: const TextStyle(color: Color(0xFF08172B)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 121, 176, 242),
                        hintText: "Confirme sua senha",
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _showConfirmPassword ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              _showConfirmPassword = !_showConfirmPassword;
                            });
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (String? confirmSenha) {
                        if (confirmSenha == null || confirmSenha.isEmpty) {
                          return "A confirmação de senha não pode ser vazia";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Botão Cadastrar
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: const Size(100, 50),
                        backgroundColor: const Color.fromARGB(255,40,112,200), // Altere a cor aqui
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Processar o cadastro
                        }
                      },
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            // Botão Voltar fixo no canto superior esquerdo
           Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
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
                ],
           ),
          ],
        ),
      ),
    );
  }
}
