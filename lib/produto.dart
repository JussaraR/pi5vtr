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
  // String id_produto;
   String id_user;

  Produto(this.email, this.password, this.id_user);

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {


  // Future<Map> productApi() async {
  //
  //   Map<String, dynamic> data_product;
  //
  //   String url = "http://192.168.31.92:8080/produto";
  //   http.Response response;
  //
  //   String id_user = widget.id_user;
  //   String id_produto = widget.id_produto;
  //   String email = widget.email;
  //   String password = widget.password;
  //
  //   Map<String, String> header = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   };
  //
  //   response = await http.post(
  //     url,
  //     headers: header,
  //     body: jsonEncode(<String, String>{
  //       'email': email,
  //       'password': password,
  //       'id_user': id_user
  //     }),
  //   );
  //
  //   data_product = json.decode(response.body);
  //
  //   return data_product;
  // }


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
                //Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15), child: Container(width: double.infinity, decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(189, 177, 51, 1), width: 1.5))), child: Center(child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15), child: Text("Meus Produtos", style: TextStyle(fontSize: 20, color: Color.fromRGBO(189, 177, 51, 1)),)),)),),
                //Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15), child: Container(width: double.infinity, decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(189, 177, 51, 1), width: 1.5))), child: Center(child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15), child: Text("Produtos", style: TextStyle(fontSize: 20, color: Color.fromRGBO(189, 177, 51, 1)),)),)),),
                //Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15), child: Container(width: double.infinity, decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(189, 177, 51, 1), width: 1.5))), child: Center(child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15), child: Text("Sobre", style: TextStyle(fontSize: 20, color: Color.fromRGBO(189, 177, 51, 1)),)),)),),
                //Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15), child: Container(width: double.infinity, decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(189, 177, 51, 1), width: 1.5))), child: Center(child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15), child: Text("Fale Conosco", style: TextStyle(fontSize: 20, color: Color.fromRGBO(189, 177, 51, 1)),)),)),),
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
            "Produto",
            style: TextStyle(
                color: Color.fromRGBO(189, 177, 51, 1)
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color.fromRGBO(4, 18, 31, 1.0)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                  onPressed: null,
                  child: Text("Termo de Garantia")
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Manual(widget.email, widget.password, widget.id_user)));
                  },
                  child: Text("Manual")
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
