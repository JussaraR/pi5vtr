import 'dart:ffi';

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

class Produto extends StatefulWidget {
   String email;
   String password;
   String id_produto;
   String id_user;
   String is_owner;

  Produto(this.email, this.password, this.id_produto, this.id_user, this.is_owner);

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {


  Future<Map> productApi() async {

    Map<String, dynamic> data_product;

    String url = "http://192.168.31.92:8080/produto";
    http.Response response;

    String id_user = widget.id_user;
    String id_produto = widget.id_produto;
    String email = widget.email;
    String password = widget.password;
    String is_owner = widget.is_owner;

    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    response = await http.post(
      url,
      headers: header,
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'password': password,
        'id_produto': id_produto,
        'is_owner': is_owner,
        'id_user': id_user
      }),
    );

    data_product = json.decode(response.body);

    return data_product;
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Produto",
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
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
          body: SingleChildScrollView( child: Container(
            padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
            width: double.infinity,
            //height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color.fromRGBO(4, 18, 31, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [

                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Text(
                          "Pedal de efeito XPTO",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                              color: Color.fromRGBO(189, 177, 51, 1)
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () async {

                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.0))),
                        backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(189, 177, 51, 1)),
                      ),
                      child: Text(
                        "Ver na loja",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.fromLTRB(0, 6, 0, 6)),

                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Image.asset(
                      "images/pedal_azul2.jpg"
                  ),
                  ),
                ),

                Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),

                Text(
                  "O Helios Overdrive é um pedal de overdrive analógico com recursos digitais avançados. Com uma ampla gama de opções de personalização, oferece o timbre perfeito para seu som. Desde sutis saturações até drives intensos, o Helios proporciona uma resposta dinâmica e orgânica. Com recursos únicos e versatilidade excepcional, é o pedal de overdrive ideal para elevar sua expressão musical. 6 modos de clipagens únicos para diversificar o seu timbre de overdrive, além disso você poderá expandir as clipagens com a funcionalidade de expansão de clipagens. O Bypass inteligente do Helios te permitirá aplicar o efeito a trechos específicos. Tecnologia de ponta para entregar muito timbre e funcionalides. Circuito de Áudio 100% Analógico junto com MCU ARM a 240Mhz. Recursos únicos que ocupam pouquíssimo espaço no seu board.",
                  style: TextStyle(
                      color: Color.fromRGBO(189, 177, 51, 1)
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Garantia(widget.email, widget.password, widget.id_user)));
                          },
                          child: Text(
                              "Termo de Garantia",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                color: Color.fromRGBO(189, 177, 51, 1)
                            ),
                          )
                      ),

                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Manual(widget.email, widget.password, widget.id_user)));
                          },
                          child: Text(
                              "Manual",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                color: Color.fromRGBO(189, 177, 51, 1)
                            ),
                          )
                      ),
                      TextButton(
                          onPressed: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => Transferencia(widget.email, widget.password, widget.id_user)));
                          },
                          child: Text(
                              "Transferir produto",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                color: Color.fromRGBO(189, 177, 51, 1)
                            ),
                          )
                      ),
                    ],
                  ),
                ),

              ],
            ),
      ))


        // body: SingleChildScrollView(
        //   child: Container(
        //     width: double.infinity,
        //     height: MediaQuery.of(context).size.height,
        //     decoration: BoxDecoration(
        //       color: Color.fromRGBO(4, 18, 31, 1.0)
        //     ),
        //     child: Column(
        //       mainAxisSize: MainAxisSize.max,
        //       children: [
        //         TextButton(
        //             onPressed: (){
        //               Navigator.push(context, MaterialPageRoute(builder: (context) => Manual(widget.email, widget.password, widget.id_user)));
        //             },
        //             child: Text("Termo de Garantia")
        //         ),
        //         TextButton(
        //           onPressed: (){
        //             Navigator.push(context, MaterialPageRoute(builder: (context) => Manual(widget.email, widget.password, widget.id_user)));
        //           },
        //           child: Text("Manual")
        //         ),
        //       ],
        //     ),
        //   ),
        // )







      ),
    );
  }
}
