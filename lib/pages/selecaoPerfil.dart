import 'package:camilly_str/pages/adicionarPerfil.dart';
import 'package:camilly_str/pages/catalogo.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';

class Selecaoperfil extends StatefulWidget {
  const Selecaoperfil({super.key});

  @override
  State<Selecaoperfil> createState() => _SelecaoperfilState();
}

class _SelecaoperfilState extends State<Selecaoperfil> {
  final TextEditingController camillyController = TextEditingController(text: "Camilly");
  final TextEditingController carolController = TextEditingController(text: "Carol");
  final TextEditingController pedroHController = TextEditingController(text: "Pedro H.");
  final TextEditingController vitoriaController = TextEditingController(text: "Vitória");
  
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.5, 1],
            colors: [
              MyColors.azulClaro, MyColors.azul, MyColors.azulEscuro
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Quem está assistindo?",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 290,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    _buildProfileTile('assets/img/camilly.png', camillyController),
                    _buildProfileTile('assets/img/carol.png', carolController),
                    _buildProfileTile('assets/img/pedroH.png', pedroHController),
                    _buildProfileTile('assets/img/vitoria.png', vitoriaController),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildAddProfileTile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTile(String imagePath, TextEditingController controller) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Catalogo()),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath,
            width: 110, 
            height: 110, 
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        controller.text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold, 
          color: Colors.white,
        ),
      ),
    ],
  );
}

  Widget _buildAddProfileTile() {
     return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Adicionarperfil()),
      );
    },
  child: Center(
    child: Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 40, 112, 200),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ), 
        ),
        const SizedBox(height: 8),
        const Text(
          'Adicionar perfil',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  ),
     );
}

void main() {
  runApp(MaterialApp(
    home: Selecaoperfil(),
  ));
}
}