import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:pi5vtr/notificacoes.dart';
import 'package:pi5vtr/card_produto.dart';
import 'package:pi5vtr/drawer_geral.dart';
import 'package:pi5vtr/url_api.dart';



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

  Future<Map> _homeApi() async {

    Map<String, dynamic> data_home;

    String url = urlApi().urlEndpoint()+"/home";
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
    print("FEZ REQUISIÇÃO");
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
            debugShowCheckedModeBanner: false,
            title: "Home",
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
                  }),
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
                    future: _homeApi(),
                    builder: (context, snapshot){

                      if(snapshot.hasData){

                        if(snapshot.data!["meus_produtos"].length != 0 && snapshot.data!["produtos"].length != 0){

                          return Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(4, 18, 31, 1.0),
                              ),
                              child: CustomScrollView(
                                slivers: [
                                  const SliverAppBar(
                                    leading: null,
                                    automaticallyImplyLeading: false,
                                    backgroundColor: Color.fromRGBO(4, 18, 31, 1),
                                    title: Text(
                                      "Produtos Adquiridos",
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
                                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(4, 18, 31, 1),
                                            ),
                                            child: cardProduto(widget.email, widget.password, widget.username, widget.id_user, snapshot.data!["meus_produtos"][index]["id_Produtos"], snapshot.data!["meus_produtos"][index]["nome_produto"], snapshot.data!["meus_produtos"][index]["descricao_encurtada"], "images/"+snapshot.data!["meus_produtos"][index]["img1"], "home")
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
                                      "Produtos VTR",
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
                                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(4, 18, 31, 1),
                                            ),
                                            child: cardProduto(widget.email, widget.password, widget.username, widget.id_user, snapshot.data!["produtos"][index]["id_Produtos"], snapshot.data!["produtos"][index]["nome_produto"], snapshot.data!["produtos"][index]["descricao_encurtada"], "images/"+snapshot.data!["produtos"][index]["img1"], "home")
                                        );
                                      },
                                      childCount: snapshot.data!["produtos"].length,
                                    ),
                                  ),
                                ],
                              )
                          );

                        }
                        else if(snapshot.data!["meus_produtos"].length == 0){

                          return Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(4, 18, 31, 1)
                            ),
                            child: CustomScrollView(
                              slivers: [
                                const SliverAppBar(
                                  leading: null,
                                  automaticallyImplyLeading: false,
                                  backgroundColor: Color.fromRGBO(4, 18, 31, 1),
                                  title: Text(
                                    "Produtos VTR",
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
                                          child: cardProduto(widget.email, widget.password, widget.username, widget.id_user, snapshot.data!["produtos"][index]["id_Produtos"], snapshot.data!["produtos"][index]["nome_produto"], snapshot.data!["produtos"][index]["descricao_encurtada"], "images/"+snapshot.data!["produtos"][index]["img1"], "home")
                                      );
                                    },
                                    childCount: snapshot.data!["produtos"].length,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                      }

                      return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(4, 18, 31, 1)
                          ),
                          child: Center(
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(),
                              )
                          ),
                        );



                    }
                )
            ),
          );
  }
}