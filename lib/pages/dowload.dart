import 'package:carol_str/pages/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Dowload());
}

class Dowload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DownloadsPage(),
    );
  }
}

class DownloadsPage extends StatelessWidget {
  final Color backButtonColor;

  DownloadsPage({this.backButtonColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.azulescuro,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView( // Utilizando ListView para permitir rolagem
          children: [
            // Linha superior com o botão de voltar e o título centralizado
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: backButtonColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Downloads",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.download,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 48), // Espaçamento para compensar o ícone de voltar
              ],
            ),
            SizedBox(height: 34),
            // Linha do conteúdo principal com a imagem e texto
            Row(
              children: [
                Container(
                  width: 170,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/img/filmePD.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(4),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: MyColors.azulfinal,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.phone_android,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Padding( // Adicionando Padding ao redor do texto
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0), // Ajuste o padding conforme necessário
                    child: Text(
                      'Como Perder um Homem em 10 Dias',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.5, // Definindo a altura da linha do texto
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    // Ação do botão de play
                  },
                ),
              ],
            ),
            // Adicione mais elementos aqui, se necessário
          ],
        ),
      ),
    );
  }
}
