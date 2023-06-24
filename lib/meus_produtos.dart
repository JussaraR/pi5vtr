import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:pi5vtr/login.dart';
import 'package:pi5vtr/card_produto.dart';
import 'package:pi5vtr/produtos_empresa.dart';
import 'package:pi5vtr/drawer_geral.dart';
import 'package:pi5vtr/url_api.dart';

class MeusProdutos extends StatefulWidget {

  String email;
  String password;
  String id_user;
  String username;

  MeusProdutos(this.email, this.password, this.id_user, this.username);

  @override
  State<MeusProdutos> createState() => _MeusProdutosState();
}

class _MeusProdutosState extends State<MeusProdutos> {


  Future<Map> _meusProdutos() async {

    Map<String, dynamic> data_home;

    String url = urlApi().urlEndpoint()+"/meus_produtos";
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
    return data_home;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meus Produtos",
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
              "Meus Produtos",
              style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(189, 177, 51, 1),
              ),
            ),
            backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

          ),
          body: Container(
            // height: ,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(4, 18, 31, 1.0),
            ),
            child: FutureBuilder<Map>(
                future: _meusProdutos(),
                builder: (context, snapshot){

                  if(snapshot.hasData){

                    if(widget.username == "" && widget.id_user == ""){
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(4, 18, 31, 1.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Faça login e veja os seus produtos!",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(189, 177, 51, 1)
                              ),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                            ElevatedButton(
                              onPressed: () async {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                ),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.fromLTRB(30, 13, 30, 13)
                                ),
                                backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(189, 177, 51, 1)),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    else if(snapshot.data!["meus_produtos"].length != 0){
                      return CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(4, 18, 31, 1),
                                    ),
                                    //child: Text("blabalbalbalbalbalba")
                                    child: cardProduto(widget.email, widget.password, widget.username, widget.id_user, snapshot.data!["meus_produtos"][index]["id_Produtos"], snapshot.data!["meus_produtos"][index]["nome_produto"], snapshot.data!["meus_produtos"][index]["descricao_encurtada"], "images/"+snapshot.data!["meus_produtos"][index]["img1"], "meus_produtos")
                                );
                              },
                              childCount: snapshot.data!["meus_produtos"].length,
                            ),
                          )
                        ],
                      );
                    }

                    else if (snapshot.data!["meus_produtos"].length == 0) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(4, 18, 31, 1.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                    "Você ainda não possui um produto, visite o catálogo!",
                                  style: TextStyle(
                                    fontSize: 17,
                                      color: Color.fromRGBO(189, 177, 51, 1)
                                  ),
                                ),
                                Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                ElevatedButton(
                                  onPressed: () async {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProdutosEmpresa(widget.email, widget.password, widget.id_user, widget.username)));
                                  },
                                  child: Text(
                                    "Ver Produtos",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.fromLTRB(30, 13, 30, 13)
                                    ),
                                    backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(189, 177, 51, 1)),
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
            ),
          ),



      ),
    );
  }
}
