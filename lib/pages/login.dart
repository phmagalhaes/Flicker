import 'package:camilly_str/pages/esqueceuSenha.dart';
import 'package:camilly_str/pages/selecaoPerfil.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importa o pacote de autenticação do Firebase
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Instância do FirebaseAuth para autenticação
  final TextEditingController _emailController =
      TextEditingController(); // Controlador para o campo de e-mail
  final TextEditingController _passwordController =
      TextEditingController(); // Controlador para o campo de senha
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  Future<void> _login() async {
    try {
      // Tenta fazer login com e-mail e senha fornecidos
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _showSnackBar('Bem vindo!', MyColors.azul);
      // Se o login for bem-sucedido, navega para a tela inicial
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Selecaoperfil() ),
      );
    } catch (e) {
      // Em caso de erro, exibe uma notificação com a mensagem de erro
      _showSnackBar('Email ou senha inválidos', Colors.red);
    }
  }

  // Método para exibir uma mensagem na parte inferior da tela (SnackBar)
  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 2), // Duração de exibição do SnackBar
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _submit() {
    if (_formKey.currentState?.validate() == true) {
      // Aqui você pode usar o valor de _rememberMe conforme necessário
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Selecaoperfil(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                  SizedBox(height: size.height * 0.1), 
                  Image.asset(
                    'assets/img/flicker.png',
                    width: size.width * 0.8, 
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
                          controller: _emailController,
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
                          controller: _passwordController,
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
                            _login();
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
              const Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      indent: 5,
                                      endIndent: 5,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Text('ou',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      indent: 5,
                                      endIndent: 5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              // Botão para login com o Google
                              Center(
                                child: TextButton(
                                  onPressed: () async {
                                    GoogleSignIn googleSignIn = GoogleSignIn();

                                    try {
                                      GoogleSignInAccount? googleUser =
                                          await googleSignIn.signIn();

                                      if (googleUser == null) {
                                        _showSnackBar(
                                            'Login cancelado pelo usuário.',
                                            Colors.red);
                                        return;
                                      }

                                      GoogleSignInAuthentication googleAuth =
                                          await googleUser.authentication;

                                      OAuthCredential credential =
                                          GoogleAuthProvider.credential(
                                        accessToken: googleAuth.accessToken,
                                        idToken: googleAuth.idToken,
                                      );

                                      UserCredential userCredential =
                                          await FirebaseAuth.instance
                                              .signInWithCredential(credential);

                                      User? user = userCredential.user;
                                      if (user != null) {
                                        print(
                                            'Usuário autenticado: ${user.displayName}');
                                        _showSnackBar(
                                            'Bem-vindo, ${user.displayName}!',
                                            MyColors.azul);

                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Selecaoperfil()),
                                        );
                                      }
                                    } catch (e) {
                                      _showSnackBar('Erro ao fazer login: $e',
                                          Colors.red);
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 16), // Ajustando o padding
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    fixedSize: Size(230,
                                        50), // Ajustando o tamanho do botão
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/img/google.png',
                                            height: 16), // Menor ícone
                                        SizedBox(width: 8),
                                        Text(
                                          'Continuar com o Google',
                                          style: TextStyle(
                                            fontSize:
                                                15, // Ajustando o tamanho da fonte
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
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
      ),
    );
  }

  buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Selecaoperfil()),
      );
    } else {
      print("form errado");
    }
  }
}