import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:pi5vtr/card_produto.dart';
import 'package:pi5vtr/drawer_geral.dart';
import 'package:pi5vtr/url_api.dart';

class ProdutosEmpresa extends StatefulWidget {
  String email;
  String password;
  String id_user;
  String username;

  ProdutosEmpresa(this.email, this.password, this.id_user, this.username);

  @override
  State<ProdutosEmpresa> createState() => _ProdutosEmpresaState();
}

class _ProdutosEmpresaState extends State<ProdutosEmpresa> {


  Future<Map> _produtosEmpresa() async {

    Map<String, dynamic> data_home;

    String url = urlApi().urlEndpoint()+"/produtos";
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
      title: "Produtos VTR",
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
            "Produtos VTR",
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
            future: _produtosEmpresa(),
            builder: (context, snapshot){

              if(snapshot.hasData){

                if(snapshot.data!["produtos"].length != 0){
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
                                child: cardProduto(widget.email, widget.password, widget.username, widget.id_user, snapshot.data!["produtos"][index]["id_Produtos"], snapshot.data!["produtos"][index]["nome_produto"], snapshot.data!["produtos"][index]["descricao_encurtada"], "images/"+snapshot.data!["produtos"][index]["img1"], "produtos_vtr")
                            );
                          },
                          childCount: snapshot.data!["produtos"].length,
                        ),
                      )
                    ],
                  );
                } else if (snapshot.data!["produtos"].length == 0) {
                  return Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(4, 18, 31, 1.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "A VTR ainda não possui produtos!",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(189, 177, 51, 1)
                          ),
                        )
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
