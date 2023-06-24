import 'package:flutter/material.dart';
import 'package:pi5vtr/drawer_geral.dart';
import 'package:pi5vtr/home_produtos.dart';



class SobreEmpresa extends StatefulWidget {

  String email;
  String password;
  String username;
  String id_user;

  SobreEmpresa(this.email, this.password, this.username, this.id_user);

  @override
  State<SobreEmpresa> createState() => _SobreEmpresaState();
}

class _SobreEmpresaState extends State<SobreEmpresa> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sobre",
      home: Scaffold(
        drawer: drawerGeral(widget.email, widget.password, widget.id_user, widget.username),
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(builder: (BuildContext context){
            return IconButton(
              icon: const Icon(Icons.menu, color: Color.fromRGBO(189, 177, 51, 1), size: 40,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },),
          title: Text(
            "Nossa História",
            style: TextStyle(
              fontSize: 25,
              color: Color.fromRGBO(189, 177, 51, 1),
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            color: Color.fromRGBO(4, 18, 31, 1),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                          Icons.arrow_back,
                          color: Color.fromRGBO(189, 177, 51, 1),
                          size: 35
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(widget.email, widget.password, widget.id_user, widget.username)));
                      },
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                Image.asset(
                  "images/vtr_logo.png",
                  width: 180,
                  height: 300,
                ),
                Row(
                  children: [
                    Text(
                      "O início",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color.fromRGBO(189, 177, 51, 1)
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                Text(
                  "O ano era 2015 e nosso fundador Ítalo se encontrava insatisfeito com sua pedaleira Zoom G1. Sonhava em desbravar o mundo dos efeitos, mas não tinha recursos financeiros para investir em um setup de pedais ou mesmo em uma nova pedaleira. Contudo, a limitação financeira não foi um empecilho para ele. Pelo contrário, diante deste cenário encontrou o ambiente perfeito para a idealização de um pedal, que de forma despretensiosa se tornaria o sonho chamado VTR EFFECTS.",
                  style: TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                      fontSize: 16
                  ),
                ),
                Image.asset(
                  "images/pedal_branco1.jpg",
                  width: 600,
                  height: 300,
                ),
                Row(
                  children: [
                    Text(
                      "O sonho",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color.fromRGBO(189, 177, 51, 1)
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                Text(
                  "Ítalo nasceu em Vitória e na época que esses fatos narrados aconteceram ele ainda morava lá, e como todo capixaba da gema, ele também é apaixonado por essa ilha, e queria criar uma marca que ajudasse a fazer sua cidade ser mais reconhecida mundo afora, pelas maravilhas que se encontra por lá, então a partir disto surgiu o nome VTR, que é uma abreviação de Vitória, e para completar uma palavra que faz jus aos produtos da empresa, e assim surgiu VTR Effects.",
                  style: TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                      fontSize: 16
                  ),
                ),
                Image.asset(
                  "images/italo.jpg",
                  width: 600,
                  height: 300,
                ),
                Row(
                  children: [
                    Text(
                      "A busca",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color.fromRGBO(189, 177, 51, 1)
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                Text(
                  "Para realmente tirar do papel a VTR, Ítalo precisava de capital financeiro, algo que ele não tinha, então entrou em cena seu professor, Denilson Machado, um engenheiro eletricista fã de punk que acompanhou todo o processo de Ítalo aprendendo a montar seus primeiros pedais, ele era quem conseguia liberar o acesso de Ítalo ao laboratório da escola e assim poder usar as ferramentas para montar seus pedais.",
                  style: TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                      fontSize: 16
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}