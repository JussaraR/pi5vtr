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



class Notificacoes extends StatefulWidget {

  String email;
  String password;
  String username;
  String id_user;

  Notificacoes(this.email, this.password, this.username, this.id_user);

  @override
  State<Notificacoes> createState() => _NotificacoesState();
}



class _NotificacoesState extends State<Notificacoes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teste",
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Home(widget.email, widget.password, widget.id_user, widget.username)));
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SobreEmpresa(widget.email, widget.password, widget.username, widget.id_user)));
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FaleConosco(widget.email, widget.password, widget.username, widget.id_user)));
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
            "Notificações",
            style: TextStyle(
                color: Color.fromRGBO(189, 177, 51, 1)
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            //border: Border.all(width: 3, color: Color.fromRGBO(189, 177, 51, 1)),
            color: Color.fromRGBO(4, 18, 31, 1),
          ),
          child: Center(
            child: ListView(
                children: [
                  Text(
                      "data",
                      style: TextStyle(
                          color: Color.fromRGBO(189, 177, 51, 1)
                    ),
                  )
                ],
              ),
            )
        )
      ),
    );
  }
}
