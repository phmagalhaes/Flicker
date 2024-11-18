import 'package:firebase_auth/firebase_auth.dart';
import 'package:flicker/shared/style.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmSenhaController = TextEditingController();
  bool _showPassword = false;
  bool _showPasswordConfirm = false;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _senhaController.text.trim(),
        );

        await userCredential.user!.updateDisplayName(_nomeController.text.trim());
        await userCredential.user!.reload();

        _showSnackBar('Cadastro realizado com sucesso!', Colors.green);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      } catch (e) {
        _showSnackBar('Erro no cadastro: ${e.toString()}', Colors.red);
      }
    }
  }

  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Container(
        padding: const EdgeInsets.all(30.0),
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.5, 1],
            colors: [
              MyColors.azulTopGratiente,
              MyColors.azulMeioGratiente,
              MyColors.azulBottomGratiente,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Voltar',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Image.asset('assets/logo.png'),
                const SizedBox(height: 50),
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
                const SizedBox(height: 50),
                _buildTextFormField("Nome", "Informe seu nome", Icons.person, _nomeController),
                _buildTextFormField("Email", "Informe seu email", Icons.mail, _emailController, isEmail: true),
                _buildTextFormField("Senha", "Informe sua senha", Icons.lock, _senhaController, isPassword: true),
                _buildTextFormField(
                  "Confirmação de Senha",
                  "Confirme sua senha",
                  Icons.lock,
                  _confirmSenhaController,
                  isPassword: true,
                  isConfirmPassword: true,
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: _register,
                    child: const Text("Cadastrar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 40, 112, 200),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
    String labelText,
    String hintText,
    IconData icon,
    TextEditingController controller, {
    bool isPassword = false,
    bool isConfirmPassword = false,
    bool isEmail = false,
  }) {
    bool isObscure = isConfirmPassword ? _showPasswordConfirm : _showPassword;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            labelText,
            style: const TextStyle(
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
            ),
          ),
        ),
        TextFormField(
          obscureText: isPassword ? !isObscure : false,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 121, 176, 242),
            hintText: hintText,
            suffixIcon: isPassword
                ? GestureDetector(
                    child: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                    onTap: () {
                      setState(() {
                        if (isConfirmPassword) {
                          _showPasswordConfirm = !_showPasswordConfirm;
                        } else {
                          _showPassword = !_showPassword;
                        }
                      });
                    },
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$labelText não pode ser vazio";
            }

            if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return "Email inválido";
            }

            if (isPassword && value.length < 6) {
              return "A senha deve ter pelo menos 6 caracteres";
            }

            if (isConfirmPassword && value != _senhaController.text) {
              return "As senhas não coincidem";
            }

            return null;
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
