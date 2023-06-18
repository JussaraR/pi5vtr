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

class Garantia extends StatefulWidget {

  String email;
  String password;
  String username;
  String id_produto;
  String id_user;

  Garantia(this.email, this.password, this.username, this.id_user, this.id_produto);

  @override
  State<Garantia> createState() => _GarantiaState();
}

class _GarantiaState extends State<Garantia> {


  Future<Map> homeApi() async {

    Map<String, dynamic> data_garantia;

    String url = "http://192.168.31.92:8080/garantia";
    http.Response response;

    String id_user = widget.id_user;
    String email = widget.email;
    String password = widget.password;
    String id_produto = widget.id_produto;

    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    response = await http.post(
      url,
      headers: header,
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'id_user': id_user,
        'id_produto': id_produto
      }),
    );

    data_garantia = json.decode(response.body);

    return data_garantia;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Garantia",
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
          title: Text(
            "Garantia",
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
              Text(
                  "A garantia dos produtos VTR Effects é vitalícia para o primeiro dono, sendo válida para os próximos donos do mesmo produto estando dentro do período de 1 ano da data da compra.",
                style: TextStyle(
                    color: Color.fromRGBO(189, 177, 51, 1)
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),

              FutureBuilder<Map>(
              future: homeApi(),
              builder: (context, snapshot) {

                if(snapshot.hasData){
                  return Row(
                    children: [
                      Text(
                        snapshot.data!["message"],
                        style: TextStyle(
                            color: Color.fromRGBO(189, 177, 51, 1)
                        ),
                      ),
                      Text(
                        snapshot.data!["diaGarantia"],
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(189, 177, 51, 1)
                        ),
                      )
                    ],
                  );
                } else {
                  return Text("");
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
