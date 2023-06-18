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
import 'package:pi5vtr/transferencia.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pi5vtr/meus_produtos.dart';
import 'package:pi5vtr/produtos_empresa.dart';


class Produto extends StatefulWidget {
   String email;
   String password;
   String username;
   String id_produto;
   String id_user;

  Produto(this.email, this.password, this.username, this.id_produto, this.id_user);

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
        'id_user': id_user
      }),
    );

    data_product = json.decode(response.body);

    return data_product;
  }


  @override
  Widget build(BuildContext context) {

    if(widget.id_user == "" && widget.email == "" && widget.password == "" && widget.username == ""){
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
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                          Icons.notifications,
                          color: Color.fromRGBO(189, 177, 51, 1),
                          size: 35
                      ),
                    )
                ),
              ],
              backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

            ),
            body: FutureBuilder<Map>(
                future: productApi(),
                builder: (context, snapshot) {

                  if (snapshot.hasData) {

                    return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          //height: 3000,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(4, 18, 31, 1),
                          ),
                          child: ListView(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            //mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      child: Text(
                                        snapshot.data!["produto"]["nome_produto"],
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
                                      final Uri url = Uri.parse(snapshot.data!["produto"]["url_produto"]);
                                      await launchUrl(url);
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
                                      "images/"+snapshot.data!["produto"]["img1"]
                                  ),
                                ),
                              ),

                              Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),

                              Text(
                                snapshot.data!["produto"]["descricao"],
                                style: TextStyle(
                                    color: Color.fromRGBO(189, 177, 51, 1)
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 3000,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                                    Text(
                                      "Comentários",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 23,
                                          color: Color.fromRGBO(189, 177, 51, 1)
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                                    Expanded(
                                      child: ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          //physics: NeverScrollableScrollPhysics(),
                                          itemCount: snapshot.data!["comentarios"].length,
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
                                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                                child: Column(
                                                  children: <Widget>[
                                                    ListTile(
                                                      title: Padding(
                                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                                        child: Text(
                                                          snapshot.data!["comentarios"][indice]["Nome"],
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w700,
                                                              color: Color.fromRGBO(189, 177, 51, 1)
                                                          ),
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        snapshot.data!["comentarios"][indice]["Comentario"],
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
                              ),
                            ],
                          ),
                        )
                    );











                  } else {
                    return SingleChildScrollView(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(4, 18, 31, 1),
                            )
                        )
                    );
                  }

                  // return Container(
                  //   width: double.infinity,
                  //   height: MediaQuery.of(context).size.height,
                  //   decoration: BoxDecoration(
                  //       color: Color.fromRGBO(4, 18, 31, 1)
                  //   ),
                  //   child: Icon(Icons.dangerous_rounded, color: Colors.white, size: 50,),
                  // );

                }
            )




        ),
      );
    }

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
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.notifications,
                      color: Color.fromRGBO(189, 177, 51, 1),
                      size: 35
                  ),
                )
            ),
          ],
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
          body: FutureBuilder<Map>(
              future: productApi(),
              builder: (context, snapshot) {

                 if (snapshot.hasData) {


                    // return CustomScrollView(
                    //   slivers: [
                    //     SliverAppBar(
                    //       leading: null,
                    //       automaticallyImplyLeading: false,
                    //       backgroundColor: Color.fromRGBO(4, 18, 31, 1),
                    //       title: Column(
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Align(
                    //                 alignment: Alignment.topLeft,
                    //                 child: Container(
                    //                   child: Text(
                    //                     snapshot.data!["produto"]["nome_produto"],
                    //                     textAlign: TextAlign.left,
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.w700,
                    //                         fontSize: 23,
                    //                         color: Color.fromRGBO(189, 177, 51, 1)
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               Spacer(),
                    //               ElevatedButton(
                    //                 onPressed: () async {
                    //                   final Uri url = Uri.parse(snapshot.data!["produto"]["url_produto"]);
                    //                   await launchUrl(url);
                    //                 },
                    //                 style: ButtonStyle(
                    //                   shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.0))),
                    //                   backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(189, 177, 51, 1)),
                    //                 ),
                    //                 child: Text(
                    //                   "Ver na loja",
                    //                   style: TextStyle(
                    //                     fontSize: 20,
                    //                     color: Colors.black,
                    //                     fontWeight: FontWeight.w400,
                    //                     fontFamily: 'Arial',
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Padding(padding: EdgeInsets.fromLTRB(0, 6, 0, 6)),
                    //
                    //           Align(
                    //             alignment: Alignment.topLeft,
                    //             child: Container(
                    //               child: Image.asset(
                    //                   "images/"+snapshot.data!["produto"]["img1"]
                    //             ),
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //       ),
                    //   ],
                    // );


                  return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        //height: 3000,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(4, 18, 31, 1),
                        ),
                        child: ListView(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    child: Text(
                                      snapshot.data!["produto"]["nome_produto"],
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
                                    final Uri url = Uri.parse(snapshot.data!["produto"]["url_produto"]);
                                    await launchUrl(url);
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
                                    "images/"+snapshot.data!["produto"]["img1"]
                              ),
                              ),
                            ),

                            Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),

                            Text(
                              // "O Helios Overdrive é um pedal de overdrive analógico com recursos digitais avançados. Com uma ampla gama de opções de personalização, oferece o timbre perfeito para seu som. Desde sutis saturações até drives intensos, o Helios proporciona uma resposta dinâmica e orgânica. Com recursos únicos e versatilidade excepcional, é o pedal de overdrive ideal para elevar sua expressão musical. 6 modos de clipagens únicos para diversificar o seu timbre de overdrive, além disso você poderá expandir as clipagens com a funcionalidade de expansão de clipagens. O Bypass inteligente do Helios te permitirá aplicar o efeito a trechos específicos. Tecnologia de ponta para entregar muito timbre e funcionalides. Circuito de Áudio 100% Analógico junto com MCU ARM a 240Mhz. Recursos únicos que ocupam pouquíssimo espaço no seu board.",
                                snapshot.data!["produto"]["descricao"],
                                style: TextStyle(
                                    color: Color.fromRGBO(189, 177, 51, 1)
                                ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 3000,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Garantia(widget.email, widget.password, widget.username, widget.id_user, widget.id_produto)));
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Manual(widget.email, widget.password, widget.username, widget.id_user)));
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Transferencia(widget.email, widget.password, widget.username, widget.id_user, widget.id_produto)));
                                    },
                                    child: Text(
                                        "Transferir produto",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 2,
                                          color: Color.fromRGBO(189, 177, 51, 1)
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                                  Text(
                                    "Comentários",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        color: Color.fromRGBO(189, 177, 51, 1)
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                                  TextField(
                                    onSubmitted: (text) async {
                                      print(text);

                                      Map<String, dynamic> data_comentario;

                                      String url = "http://192.168.31.92:8080/comentario";
                                      http.Response response;

                                      String comentario = text;

                                      Map<String, String> header = {
                                        'Content-Type': 'application/json; charset=UTF-8',
                                      };

                                      response = await http.post(
                                        url,
                                        headers: header,
                                        body: jsonEncode(<String, String>{
                                          'email': widget.email,
                                          'password': widget.password,
                                          'id_user': widget.id_user,
                                          'id_produto': widget.id_produto,
                                          'comentario': comentario,
                                          'username': widget.username
                                        }),
                                      );

                                      data_comentario = json.decode(response.body);

                                    },
                                    style: TextStyle(
                                      color: Color.fromRGBO(189, 177, 51, 1),
                                    ),
                                    keyboardType: TextInputType.text,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1, color: Color.fromRGBO(189, 177, 51, 1))),
                                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1, color: Color.fromRGBO(189, 177, 51, 1))),
                                        label: Text(
                                            "Escreva um comentário",
                                            style: TextStyle(
                                              color: Color.fromRGBO(189, 177, 51, 1),
                                            )
                                        ),
                                        border: OutlineInputBorder()
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                                  Expanded(
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        //physics: NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data!["comentarios"].length,
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
                                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                              child: Column(
                                                children: <Widget>[
                                                  ListTile(
                                                    title: Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                                      child: Text(
                                                        snapshot.data!["comentarios"][indice]["Nome"],
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w700,
                                                            color: Color.fromRGBO(189, 177, 51, 1)
                                                        ),
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                      snapshot.data!["comentarios"][indice]["Comentario"],
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
                            ),
                          ],
                        ),
                      )
                  );











                 } else {
                   return SingleChildScrollView(
                       child: Container(
                        padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(4, 18, 31, 1),
                        )
                      )
                   );
                 }

                // return Container(
                //   width: double.infinity,
                //   height: MediaQuery.of(context).size.height,
                //   decoration: BoxDecoration(
                //       color: Color.fromRGBO(4, 18, 31, 1)
                //   ),
                //   child: Icon(Icons.dangerous_rounded, color: Colors.white, size: 50,),
                // );

              }
            )




      ),
    );
  }
}
