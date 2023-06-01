import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pi5vtr/fale_conosco.dart';
import "dart:convert";
import 'package:pi5vtr/manual.dart';
import 'package:pi5vtr/garantia.dart';
import 'package:pi5vtr/produto.dart';
import 'package:pi5vtr/login.dart';
import 'package:pi5vtr/home_produtos.dart';
import 'package:pi5vtr/sobre.dart';

class Manual extends StatefulWidget {
   String email;
   String password;
  // String id_produto;
   String id_user;

   Manual(this.email, this.password, this.id_user);

  @override
  State<Manual> createState() => _ManualState();
}

class _ManualState extends State<Manual> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Manual",
      home: Scaffold(
        drawer: Drawer(
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),
          child: Column(
            children: [
              ListTile(
                title: Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 15), child: Center(child: Text("Menu", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30, color: Color.fromRGBO(189, 177, 51, 1)),))),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(189, 177, 51, 1),
                                width: 1.5
                            ),
                            top: BorderSide(
                                color: Color.fromRGBO(189, 177, 51, 1),
                                width: 1.5
                            )
                        )
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(widget.email, widget.password, widget.id_user)));
                            },
                            child: Text(
                                "Home", style: TextStyle(fontSize: 20, color: Color.fromRGBO(189, 177, 51, 1))
                            ),
                          )
                      ),
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(189, 177, 51, 1),
                                width: 1.5
                            ),
                        )
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: TextButton(
                            onPressed: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => Home(widget.email, widget.password, widget.id_user)));
                            },
                            child: Text(
                                "Meus Produtos", style: TextStyle(fontSize: 20, color: Color.fromRGBO(189, 177, 51, 1))
                            ),
                          )
                      ),
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(189, 177, 51, 1),
                                width: 1.5
                            ),
                        )
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: TextButton(
                            onPressed: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => Home(widget.email, widget.password, widget.id_user)));
                            },
                            child: Text(
                                "Produtos", style: TextStyle(fontSize: 20, color: Color.fromRGBO(189, 177, 51, 1))
                            ),
                          )
                      ),
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(189, 177, 51, 1),
                                width: 1.5
                            ),
                        )
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SobreEmpresa(widget.email, widget.password, widget.id_user)));
                            },
                            child: Text(
                                "Sobre", style: TextStyle(fontSize: 20, color: Color.fromRGBO(189, 177, 51, 1))
                            ),
                          )
                      ),
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(189, 177, 51, 1),
                              width: 1.5
                          ),
                        )
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FaleConosco(widget.email, widget.password, widget.id_user)));
                            },
                            child: Text(
                                "Fale Conosco", style: TextStyle(fontSize: 20, color: Color.fromRGBO(189, 177, 51, 1))
                            ),
                          )
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
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
                color: Color.fromRGBO(189, 177, 51, 1)
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body: Container(
          color: Color.fromRGBO(4, 18, 31, 1),
          child: Column(
            children: [
              Center(
                child: Text(
                  "O Helios Overdrive é um pedal de overdrive analógico com recursos digitais avançados. Com uma ampla gama de opções de personalização, oferece o timbre perfeito para seu som. Desde sutis saturações até drives intensos, o Helios proporciona uma resposta dinâmica e orgânica. Com recursos únicos e versatilidade excepcional, é o pedal de overdrive ideal para elevar sua expressão musical. 6 modos de clipagens únicos para diversificar o seu timbre de overdrive, além disso você poderá expandir as clipagens com a funcionalidade de expansão de clipagens. O Bypass inteligente do Helios te permitirá aplicar o efeito a trechos específicos. Tecnologia de ponta para entregar muito timbre e funcionalides. Circuito de Áudio 100% Analógico junto com MCU ARM a 240Mhz. Recursos únicos que ocupam pouquíssimo espaço no seu board.",
                  style: TextStyle(
                    color: Color.fromRGBO(189, 177, 51, 1)
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