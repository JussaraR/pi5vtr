import 'package:flutter/material.dart';
import 'package:pi5vtr/drawer_geral.dart';
import 'package:pi5vtr/produto.dart';


class Manual extends StatefulWidget {
   String email;
   String password;
   String username;
   String id_user;
   String were_from;
   String id_produto;

   Manual(this.email, this.password, this.username, this.id_user, this.were_from, this.id_produto);

  @override
  State<Manual> createState() => _ManualState();
}

class _ManualState extends State<Manual> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Manual",
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
            "Manual",
            style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(189, 177, 51, 1)
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Produto(widget.email, widget.password, widget.username, widget.id_produto, widget.id_user, widget.were_from)));
                    },
                  ),
                ],
              ),
              Center(
                child: Text(
                  "O Helios Overdrive é um pedal de overdrive analógico com recursos digitais avançados. Com uma ampla gama de opções de personalização, oferece o timbre perfeito para seu som. Desde sutis saturações até drives intensos, o Helios proporciona uma resposta dinâmica e orgânica. Com recursos únicos e versatilidade excepcional, é o pedal de overdrive ideal para elevar sua expressão musical. 6 modos de clipagens únicos para diversificar o seu timbre de overdrive, além disso você poderá expandir as clipagens com a funcionalidade de expansão de clipagens. O Bypass inteligente do Helios te permitirá aplicar o efeito a trechos específicos. Tecnologia de ponta para entregar muito timbre e funcionalides. Circuito de Áudio 100% Analógico junto com MCU ARM a 240Mhz. Recursos únicos que ocupam pouquíssimo espaço no seu board.",
                  style: TextStyle(
                    color: Color.fromRGBO(159, 159, 159, 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
