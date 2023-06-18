import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pi5vtr/fale_conosco.dart';
import "dart:convert";
import 'package:pi5vtr/manual.dart';
import 'package:pi5vtr/garantia.dart';
import 'package:pi5vtr/notificacoes.dart';
import 'package:pi5vtr/produto.dart';
import 'package:pi5vtr/login.dart';
import 'package:pi5vtr/home_produtos.dart';
import 'package:pi5vtr/sobre.dart';
import 'package:pi5vtr/card_produto.dart';
import 'package:pi5vtr/meus_produtos.dart';
import 'package:pi5vtr/produtos_empresa.dart';

class Home extends StatefulWidget {

  String email;
  String password;
  String id_user;
  String username;

  Home(this.email, this.password, this.id_user, this.username);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List meus_produtos = [];
  List produtos = [];

  Future<Map> homeApi() async {

    Map<String, dynamic> data_home;

    String url = "http://192.168.31.92:8080/home";
    http.Response response;

    String id_user = widget.id_user;
    String email = widget.email;
    String password = widget.password;

    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    response = await http.post(
      url,
      headers: header,
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'id_user': id_user
      }),
    );

    data_home = json.decode(response.body);

    for(int i =0; i < data_home["meus_produtos"].length; i++){
      meus_produtos.add(data_home["meus_produtos"][i]);
    };
    for(int i =0; i < data_home["produtos"].length; i++){
      produtos.add(data_home["produtos"][i]);
    }
    return data_home;
  }

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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MeusProdutos(widget.email, widget.password, widget.id_user, widget.username)));
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProdutosEmpresa(widget.email, widget.password, widget.id_user, widget.username)));
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
                Spacer(),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Sair",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(30, 7, 30, 7)
                      ),
                      backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(189, 177, 51, 1)),
                    ),
                  ),
                )
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

            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    icon: Icon(
                        Icons.notifications,
                        color: Color.fromRGBO(189, 177, 51, 1),
                        size: 35
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Notificacoes(widget.email, widget.password, widget.username, widget.id_user)));
                    },
                  ),
              ),
            ],

            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(189, 177, 51, 1),
              ),
            ),
            backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

          ),
          body: FutureBuilder<Map>(
            future: homeApi(),
            builder: (context, snapshot){

              if(snapshot.hasData){

                if(snapshot.data!["meus_produtos"].length != 0 && snapshot.data!["produtos"].length != 0){

                  return CustomScrollView(
                      slivers: [
                        const SliverAppBar(
                          leading: null,
                          automaticallyImplyLeading: false,
                          backgroundColor: Color.fromRGBO(4, 18, 31, 1),
                          title: Text(
                            "Meus Produtos",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 23,
                                color: Color.fromRGBO(189, 177, 51, 1)
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(4, 18, 31, 1),
                                    ),
                                    child: cardProduto(widget.email, widget.password, widget.username, widget.id_user, snapshot.data!["meus_produtos"][index]["id_Produtos"], snapshot.data!["meus_produtos"][index]["nome_produto"], snapshot.data!["meus_produtos"][index]["descricao_encurtada"], "images/"+snapshot.data!["meus_produtos"][index]["img1"], "true")
                                  );
                            },
                            childCount: snapshot.data!["meus_produtos"].length,
                          ),
                        ),
                        const SliverAppBar(
                          leading: null,
                          automaticallyImplyLeading: false,
                          backgroundColor: Color.fromRGBO(4, 18, 31, 1),
                          title: Text(
                            "Produtos",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 23,
                                color: Color.fromRGBO(189, 177, 51, 1)
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {

                              return Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(4, 18, 31, 1),
                                  ),
                                  child: cardProduto(widget.email, widget.password, widget.username, widget.id_user, snapshot.data!["produtos"][index]["id_Produtos"], snapshot.data!["produtos"][index]["nome_produto"], snapshot.data!["produtos"][index]["descricao_encurtada"], "images/"+snapshot.data!["produtos"][index]["img1"], "true")
                              );
                              },
                            childCount: snapshot.data!["produtos"].length,
                          ),
                        ),
                      ],
                  );



                  // return SingleChildScrollView(
                  //     child: Container(
                  //     padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
                  //     width: double.infinity,
                  //     height: MediaQuery.of(context).size.height,
                  //     decoration: BoxDecoration(
                  //       //border: Border.all(width: 3, color: Color.fromRGBO(189, 177, 51, 1)),
                  //       color: Color.fromRGBO(4, 18, 31, 1),
                  //     ),
                  //     child: Column(
                  //       //mainAxisSize: MainAxisSize.max,
                  //       children: [
                  //         Align(
                  //           alignment: Alignment.topLeft,
                  //           child: Container(
                  //             child: Text(
                  //               "Meus Produtos",
                  //               textAlign: TextAlign.left,
                  //               style: TextStyle(
                  //                   fontSize: 23,
                  //                   color: Color.fromRGBO(189, 177, 51, 1)
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                  //         Expanded(
                  //           child: ListView.builder(
                  //               physics: NeverScrollableScrollPhysics(),
                  //               itemCount: snapshot.data!["meus_produtos"].length,
                  //               itemBuilder: (context, indice){
                  //                 return cardProduto(widget.email, widget.password, widget.id_user, snapshot.data!["meus_produtos"][indice]["id_Produtos"], snapshot.data!["meus_produtos"][indice]["nome_produto"], snapshot.data!["produtos"][indice]["descricao_encurtada"], "images/"+snapshot.data!["meus_produtos"][indice]["img1"], "true");
                  //               }
                  //           ),
                  //         ),
                  //         Align(
                  //           alignment: Alignment.topLeft,
                  //           child: Container(
                  //             child: Text(
                  //               "Produtos",
                  //               textAlign: TextAlign.left,
                  //               style: TextStyle(
                  //                   fontSize: 23,
                  //                   color: Color.fromRGBO(189, 177, 51, 1)
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                  //         Expanded(
                  //           //height: 400,
                  //           //height: MediaQuery.of(context).size.height,
                  //           child: ListView.builder(
                  //               physics: NeverScrollableScrollPhysics(),
                  //               itemCount: snapshot.data!["produtos"].length,
                  //               itemBuilder: (context, indice){
                  //                 return cardProduto(widget.email, widget.password, widget.id_user, snapshot.data!["produtos"][indice]["id_Produtos"], snapshot.data!["produtos"][indice]["nome_produto"], snapshot.data!["produtos"][indice]["descricao_encurtada"], "images/"+snapshot.data!["produtos"][indice]["img1"], "false");
                  //               }
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   )
                  // );

                } else if(snapshot.data!["meus_produtos"].length == 0){
                  return SingleChildScrollView( child: Container(
                    padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      //border: Border.all(width: 3, color: Color.fromRGBO(189, 177, 51, 1)),
                      color: Color.fromRGBO(4, 18, 31, 1),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(
                              "Produtos",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Color.fromRGBO(189, 177, 51, 1)
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                        Container(
                          height: 400,
                          //height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!["produtos"].length,
                              itemBuilder: (context, indice){
                                return Card(
                                  margin: EdgeInsets.only(bottom: 10),
                                  color: Color.fromRGBO(4, 18, 31, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                      width: 1.5,
                                      color: Color.fromRGBO(189, 177, 51, 1),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                                    child: Column(
                                      children: <Widget>[
                                        ListTile(
                                          leading: Image.asset(
                                              "images/pedal_azul2.jpg"
                                          ),
                                          title: Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 0, 23),
                                            child: Text(
                                              snapshot.data!["produtos"][indice]["nome_produto"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(189, 177, 51, 1)
                                              ),
                                            ),
                                          ),
                                          subtitle: Text(
                                            'Pedal de efeito muito brabo XPTO',
                                            style: TextStyle(
                                                color: Color.fromRGBO(189, 177, 51, 1)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  ));
                }

              }

              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(4, 18, 31, 1)
                ),
                child: Icon(Icons.dangerous_rounded, color: Colors.white, size: 50,),
              );


            }
          )
      ),
    );
  }
}