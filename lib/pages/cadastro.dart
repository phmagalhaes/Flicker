import 'package:camilly_str/pages/splashScreen.dart';
import 'package:camilly_str/shared/style.dart';
import "package:flutter/material.dart";
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importa o pacote de autenticação do Firebase

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassaword = false;
  bool _showPassaword1 = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();


  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Tenta criar o usuário com e-mail e senha
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          // username: _usernameController.text.trim(),
        );

        // Tenta atualizar o nome do usuário
        await userCredential.user!.updateDisplayName(_usernameController.text.trim());
        await userCredential.user!.reload();
        _auth.currentUser; // Recarrega o usuário atualizado

        // Exibe uma notificação de sucesso e redireciona
        _showSnackBar('Cadastro realizado com sucesso!', MyColors.azul);
        Navigator.pop(context); // Volta para a tela de login após o cadastro
      } catch (e) {
        // Exibe uma notificação de erro específico
        _showSnackBar('Erro no cadastro', Colors.red);
      }
    }
  }

   // final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  String? _senha;
  String? _confirmarSenha;
  
  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [MyColors.azulClaro, MyColors.azul, MyColors.azulEscuro]),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      IconButton(
                    icon: Icon(Icons.arrow_back,
                    color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context); 
                    },
                  ),
                  Text(
                    'Voltar',
                    style: TextStyle(fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                          Shadow(
                            offset: Offset(1.0, 3.5),
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 3.0,
                          )
                        ]),
                  ),
                    ],
                  ),
                  Image.asset('assets/img/flicker.png',),
                  SizedBox(height: 20,),
                  Text(
                    "Cadastre-se",
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
                  SizedBox(height: 30,),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Alinha tudo à esquerda
                    children: [
                      Text(
                        "Nome",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 3.5),
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          controller: _usernameController,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "Digite seu nome completo",
                            hintStyle:
                                TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 121, 176, 242),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242),
                                  width: 2),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 15)
                          ),
                          validator: (String? nome) {
                            if (nome == "" || nome == null) {
                              return "O nome não pode estar vazio";
                            }
                            if (nome.length < 6) {
                              return "O nome está muito curto";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height:16),
                      Text(
                        "CPF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 3.5),
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          controller: _cpfController,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "Digite seu CPF",
                            hintStyle:
                                TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 121, 176, 242),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242),
                                  width: 2),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 15)
                          ),
                          validator: (String? cpf) {
                            if (cpf == "" || cpf == null) {
                              return "O CPF não pode estar vazio";
                            }
                            if (cpf.length < 11) {
                              return "O CPF está muito curto";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Telefone",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(1.0, 3.5),
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 3.0,
                              )
                            ]),
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "Digite seu telefone",
                            hintStyle:
                                TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 121, 176, 242),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242),
                                  width: 2),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 15)
                          ),
                          validator: (String? telefone) {
                            if (telefone == "" || telefone == null) {
                              return "O telefone não pode estar vazio";
                            }
                            if (telefone.length < 6) {
                              return "O telefone está muito curto";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height:16),
                      Text(
                        "E-mail",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(1.0, 3.5),
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 3.0,
                              )
                            ]),
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          controller: _emailController,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "Digite seu email",
                            hintStyle:
                                TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 121, 176, 242),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242),
                                  width: 2),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 15)
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
                      SizedBox(height:16),
                      Text(
                        "Senha",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(1.0, 3.5),
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 3.0,
                              )
                            ]),
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          controller: _passwordController,
                          autofocus: true,
                          obscureText: !_showPassaword,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              child: Icon(
                                _showPassaword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromARGB(255, 27, 95, 179),
                              ),
                              onTap: () {
                                setState(() {
                                  _showPassaword = !_showPassaword;
                                });
                              },
                            ),
                            hintText: "Digite sua senha",
                            hintStyle:
                                TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 121, 176, 242),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242),
                                  width: 2),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 15)
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
                      SizedBox(height:16),
                      Text(
                        "Confirme a senha",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(1.0, 3.5),
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 3.0,
                              )
                            ]),
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          autofocus: true,
                          obscureText: !_showPassaword1,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              child: Icon(
                                _showPassaword1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromARGB(255, 27, 95, 179),
                              ),
                              onTap: () {
                                setState(() {
                                  _showPassaword1 = !_showPassaword1;
                                });
                              },
                            ),
                            hintText: "Confirme sua senha",
                            hintStyle:
                                TextStyle(color: Color.fromARGB(255, 27, 95, 179)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 121, 176, 242),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 176, 242),
                                  width: 2),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 15)
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
                      SizedBox(height: 16),
                      
                    ],
                  ),
                  ElevatedButton(
                        onPressed: _register,
                        child: const Text("Cadastrar",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 40, 112, 200),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      )
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