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
import 'package:pi5vtr/resgatar_produto.dart';

class ResgatarProd extends StatefulWidget {

  String id_user;
  String username;
  String email;
  String password;

  ResgatarProd(this.email, this.password, this.username, this.id_user);


  @override
  State<ResgatarProd> createState() => _ResgatarProdState();
}

class _ResgatarProdState extends State<ResgatarProd> {

  TextEditingController _codigoProduto = TextEditingController();

  String mensagemSucesso = "";
  String mensagemErro = "";

  @override
  Widget build(BuildContext context) {

    // TELA RESGATAR PRODUTO OFFLINE
    if(widget.username ==  "" && widget.email ==  "" && widget.password ==  ""){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Resgatar Produto",
        home: Scaffold(
            drawer: Drawer(
              backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),
              child: Column(
                children: [
                  ListTile(
                    title: Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 15), child: Center(child: Text("Menu", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30, color: Color.fromRGBO(189, 177, 51, 1)),))),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(92, 92, 92, 1),
                                    width: 1.5
                                ),
                                top: BorderSide(
                                    color: Color.fromRGBO(92, 92, 92, 1),
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
                                    "Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
                                  color: Color.fromRGBO(92, 92, 92, 1),
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
                                    "Meus Produtos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
                                  color: Color.fromRGBO(92, 92, 92, 1),
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
                                    "Produtos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
                                  color: Color.fromRGBO(92, 92, 92, 1),
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
                                    "Sobre", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
                                  color: Color.fromRGBO(92, 92, 92, 1),
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
                                    "Fale Conosco", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
                                  color: Color.fromRGBO(92, 92, 92, 1),
                                  width: 1.5
                              ),
                            )
                        ),
                        child: Center(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResgatarProd(widget.email, widget.password, widget.username, widget.id_user)));
                                },
                                child: Text(
                                    "Resgatar Produto", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
                "Resgatar Produto",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromRGBO(189, 177, 51, 1),
                ),
              ),
              backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

            ),
            body: Container(
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
                    "Faça login para resgatar seus produtos!",
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
            )
        ),
      );
    }

    // TELA DE RESGATAR PRODUTO LOGADO
    else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Resgatar Produto",
        home: Scaffold(
          drawer: Drawer(
            backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),
            child: Column(
              children: [
                ListTile(
                  title: Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 15), child: Center(child: Text("Menu", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30, color: Color.fromRGBO(189, 177, 51, 1)),))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(92, 92, 92, 1),
                                  width: 1.5
                              ),
                              top: BorderSide(
                                  color: Color.fromRGBO(92, 92, 92, 1),
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
                                  "Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
                                color: Color.fromRGBO(92, 92, 92, 1),
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
                                  "Meus Produtos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
                                color: Color.fromRGBO(92, 92, 92, 1),
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
                                  "Produtos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
                                color: Color.fromRGBO(92, 92, 92, 1),
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
                                  "Sobre", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
                                color: Color.fromRGBO(92, 92, 92, 1),
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
                                  "Fale Conosco", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
                                color: Color.fromRGBO(92, 92, 92, 1),
                                width: 1.5
                            ),
                          )
                      ),
                      child: Center(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ResgatarProd(widget.email, widget.password, widget.username, widget.id_user)));
                              },
                              child: Text(
                                  "Resgatar Produto", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
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
            backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),
          ),
          body:
            Container(
            height: MediaQuery.of(context).size.height,
            color: Color.fromRGBO(4, 18, 31, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    "Resgatar Produto",
                    style: TextStyle(
                        fontSize: 23,
                        color: Color.fromRGBO(189, 177, 51, 1),
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 40),
                  child: Text(
                    "Ao resgatar um produto adquirido, ele constará  como adquirido no aplicativo e sua garantia será vitalícia caso seja primeiro dono!",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(159, 159, 159, 1),
                      // fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Text(
                  mensagemErro,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.5,
                    color: Colors.red,
                  ),
                ),
                Text(
                  mensagemSucesso,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.5,
                    color: Colors.green,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 80, 10, 85),
                  child: TextField(
                    controller: _codigoProduto,
                    style: TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                        label: Text(
                            "Código do produto",
                            style: TextStyle(
                              color: Color.fromRGBO(159, 159, 159, 1),
                            )
                        ),
                        border: OutlineInputBorder()
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () async {
                    if(_codigoProduto.text == ""){
                      setState(() {
                        mensagemErro = "Digite um código";
                      });

                    } else {
                      String identifyer = _codigoProduto.text[0]+_codigoProduto.text[1];
                      int id_produto = 0;
                      print(identifyer);

                      if(_codigoProduto.text[4] != "-" || _codigoProduto.text[9] != "-"){
                        setState(() {
                          mensagemErro = "Digite um código válido";
                        });

                      } else if (identifyer == "ND" || identifyer == "KR" || identifyer == "HO"){

                        if(identifyer == "ND"){
                          id_produto = 1;
                        } else if (identifyer == "KR"){
                          id_produto = 2;
                        } else if (identifyer == "HO"){
                          id_produto = 3;
                        }

                        String url = "http://192.168.31.92:8080/resgatar_produto";
                        http.Response response;

                        Map<String, String> header = {
                          'Content-Type': 'application/json; charset=UTF-8',
                        };

                        Map<String, dynamic> data_resgate;

                        response = await http.post(
                          url,
                          headers: header,
                          body: jsonEncode(<String, dynamic>{
                            'email': widget.email,
                            'password': widget.password,
                            'id_produto': id_produto,
                            'id_user': widget.id_user,
                          }),
                        );
                        //
                        data_resgate = json.decode(response.body);

                        if(data_resgate["status_code"] == 200){
                          setState(() {
                            mensagemErro = "";
                          });
                          setState(() {
                            mensagemSucesso = data_resgate["message"];
                          });

                        } else {
                          setState(() {
                            mensagemErro = data_resgate["message"];
                          });
                        }


                      } else {
                        setState(() {
                          mensagemErro = "Digite um código válido";
                        });
                      }



                    }
                  },
                  child: Text(
                    "Resgatar",
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
          ),
          // ),
        ),
      );
    }
  }
}
