import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class SobreEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teste",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: null, icon: Icon(Icons.menu, color: Color.fromRGBO(189, 177, 51, 1), size: 40,),),
          title: Text(
            "Nossa História",
            style: TextStyle(
              color: Color.fromRGBO(189, 177, 51, 1),
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(4, 18, 31, 1),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 20)),
                Image.asset(
                  "images/vtr_logo.png",
                  width: 500,
                  height: 300,
                ),
                Text(
                  "O ano era 2015 e nosso fundador Ítalo se encontrava insatisfeito com sua pedaleira Zoom G1. Sonhava em desbravar o mundo dos efeitos, mas não tinha recursos financeiros para investir em um setup de pedais ou mesmo em uma nova pedaleira. Contudo, a limitação financeira não foi um empecilho para ele. Pelo contrário, diante deste cenário encontrou o ambiente perfeito para a idealização de um pedal, que de forma despretensiosa se tornaria o sonho chamado VTR EFFECTS.",
                  style: TextStyle(
                      color: Color.fromRGBO(189, 177, 51, 1),
                      fontSize: 18
                  ),
                ),
                Image.asset(
                  "images/pedal_branco1.jpg",
                  width: 600,
                  height: 300,
                ),
                Text(
                  "Ítalo nasceu em Vitória e na época que esses fatos narrados aconteceram ele ainda morava lá, e como todo capixaba da gema, ele também é apaixonado por essa ilha, e queria criar uma marca que ajudasse a fazer sua cidade ser mais reconhecida mundo afora, pelas maravilhas que se encontra por lá, então a partir disto surgiu o nome VTR, que é uma abreviação de Vitória, e para completar uma palavra que faz jus aos produtos da empresa, e assim surgiu VTR Effects.",
                  style: TextStyle(
                      color: Color.fromRGBO(189, 177, 51, 1),
                      fontSize: 18
                  ),
                ),
                Image.asset(
                  "images/italo.jpg",
                  width: 600,
                  height: 300,
                ),
                Text(
                  "Para realmente tirar do papel a VTR, Ítalo precisava de capital financeiro, algo que ele não tinha, então entrou em cena seu professor, Denilson Machado, um engenheiro eletricista fã de punk que acompanhou todo o processo de Ítalo aprendendo a montar seus primeiros pedais, ele era quem conseguia liberar o acesso de Ítalo ao laboratório da escola e assim poder usar as ferramentas para montar seus pedais.",
                  style: TextStyle(
                      color: Color.fromRGBO(189, 177, 51, 1),
                      fontSize: 18
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}