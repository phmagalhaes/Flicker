import 'package:flicker/shared/style.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showPasswordConfirm = false;
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmSenhaController = TextEditingController();

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
                Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white), // Seta para voltar
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        'Voltar',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                      )
                    ]),

                const SizedBox(height: 50,),
                Image.asset('assets/logo.png'),
                const SizedBox(
                  height: 50,
                ),
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
                const SizedBox(
                  height: 50,
                ),
                _buildTextFormField("Nome", "Informe seu nome", Icons.person, true),
                _buildTextFormField("Telefone", "Informe seu telefone", Icons.phone, true, isPhone: true),
                _buildTextFormField("CPF", "Informe seu CPF", Icons.numbers, true, isCpf: true),
                _buildTextFormField("Email", "Informe seu email", Icons.mail, true, isEmail: true),
                _buildTextFormField("Senha", "Informe sua senha", Icons.lock, true, isPassword: true, isConfirmPassword: false),
                _buildTextFormField("Confirmação de Senha", "Confirme sua senha", Icons.lock, true, isPassword: true, isConfirmPassword: true),

                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      buttonEnterClick();
                    },
                    child: Text("Cadastrar"),
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
      bool isRequired, {
        bool isPassword = false,
        bool isConfirmPassword = false,
        bool isEmail = false,
        bool isPhone = false,
        bool isCpf = false,
      }) {
    bool isObscure = isConfirmPassword ? _showPasswordConfirm : _showPassword;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(labelText,
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
              )),
        ),
        TextFormField(
          obscureText: isPassword ? !isObscure : false,
          controller: isPassword && !isConfirmPassword
              ? _senhaController
              : isConfirmPassword
                  ? _confirmSenhaController
                  : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 121, 176, 242),
            hintText: hintText,
            iconColor: Colors.blue.shade900,
            suffixIcon: isPassword
                ? GestureDetector(
                    child: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
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
            contentPadding: const EdgeInsets.symmetric(
                vertical: 0, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Color(0xFF08172B)),
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return "O $labelText não pode ser vazio";
            }

            if (isEmail && !_validateEmail(value!)) {
              return "O email é inválido";
            }

            if (isPhone && !_validatePhone(value!)) {
              return "O telefone é inválido";
            }

            if (isCpf && !_validateCpf(value!)) {
              return "O CPF é inválido";
            }

            if (isPassword && value!.length < 6) {
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

  bool _validateEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  bool _validatePhone(String phone) {
    final regex = RegExp(r'^\+?\d{10,15}$');
    return regex.hasMatch(phone);
  }

  bool _validateCpf(String cpf) {
    final regex = RegExp(r'^\d{11}$');
    return regex.hasMatch(cpf);
  }

  buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    } else {
      print("Erro no formulário");
    }
  }
}
