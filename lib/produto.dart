import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:pi5vtr/manual.dart';
import 'package:pi5vtr/garantia.dart';
import 'package:pi5vtr/transferencia.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pi5vtr/drawer_geral.dart';
import 'package:pi5vtr/url_api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pi5vtr/home_produtos.dart';
import 'package:pi5vtr/meus_produtos.dart';
import 'package:pi5vtr/produtos_empresa.dart';


class Produto extends StatefulWidget {
   String email;
   String password;
   String username;
   String id_produto;
   String id_user;
   String were_from;

  Produto(this.email, this.password, this.username, this.id_produto, this.id_user, this.were_from);

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {


  Future<Map> _productApi() async {

    Map<String, dynamic> data_product;

    String url = urlApi().urlEndpoint()+"/produto";
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


    // TELA DE PRODUTO OFFLINE
    if(widget.id_user == "" && widget.email == "" && widget.password == "" && widget.username == ""){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Produto",
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
              backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

            ),
            body: FutureBuilder<Map>(
                future: _productApi(),
                builder: (context, snapshot) {

                  if (snapshot.hasData) {
                    return Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(4, 18, 31, 1.0),
                        ),
                        child: CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                  Icons.arrow_back,
                                                  color: Color.fromRGBO(189, 177, 51, 1),
                                                  size: 35
                                              ),
                                              onPressed: () {
                                                if(widget.were_from == "home"){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(widget.email, widget.password, widget.id_user, widget.username)));
                                                }
                                                else if (widget.were_from == "meus_produtos"){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MeusProdutos(widget.email, widget.password, widget.id_user, widget.username)));
                                                }
                                                else if (widget.were_from == "produtos_vtr"){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProdutosEmpresa(widget.email, widget.password, widget.id_user, widget.username)));
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 0))
                                    ],
                                  )
                              ),
                              SliverToBoxAdapter(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Column(
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
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Arial',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(padding: EdgeInsets.fromLTRB(0, 6, 0, 6)),
                                      CarouselSlider(
                                        options: CarouselOptions(),
                                        items: [
                                          "images/"+snapshot.data!["produto"]["img1"],
                                          "images/"+snapshot.data!["produto"]["img2"],
                                          "images/"+snapshot.data!["produto"]["img3"],
                                          "images/"+snapshot.data!["produto"]["img4"],
                                          "images/"+snapshot.data!["produto"]["img5"],
                                        ].map((i) {
                                          return Builder(builder: (BuildContext context) {
                                            return Container(
                                              // width: 300,
                                              height: 300,
                                              // margin: const EdgeInsets.symmetric(horizontal: 300),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Image.asset(
                                                      i,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                        }).toList(),
                                      ),
                                      Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                                      Text(
                                        snapshot.data!["produto"]["descricao"],
                                        style: TextStyle(
                                          color: Color.fromRGBO(159, 159, 159, 1),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        // height: 3000,
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // LISTA COMENTARIOS
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {

                                    if(snapshot.data!["comentarios"].length == 0){
                                      return Container(
                                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(4, 18, 31, 1),
                                          ),
                                          child: Card(
                                            // margin: EdgeInsets.only(bottom: 10),
                                            color: Color.fromRGBO(4, 18, 31, 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              side: BorderSide(
                                                width: 1,
                                                color: Color.fromRGBO(92, 92, 92, 1),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                              child: Column(

                                                children: <Widget>[

                                                  ListTile(
                                                    title: Text(
                                                      "Este produto ainda não possui comentários!",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(159, 159, 159, 1),
                                                      ),
                                                    ),
                                                  ),


                                                ],
                                              ),
                                            ),
                                          )
                                      );
                                    }
                                    else {
                                      return Container(
                                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(4, 18, 31, 1),
                                          ),
                                          child: Card(
                                            margin: EdgeInsets.only(bottom: 10),
                                            color: Color.fromRGBO(4, 18, 31, 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              side: BorderSide(
                                                width: 1,
                                                color: Color.fromRGBO(92, 92, 92, 1),
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
                                                        snapshot.data!["comentarios"][index]["Nome"],
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w400,
                                                            color: Color.fromRGBO(189, 177, 51, 1)
                                                        ),
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                      snapshot.data!["comentarios"][index]["Comentario"],
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(159, 159, 159, 1),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                      );
                                    }
                                  },
                                  childCount: snapshot.data!["comentarios"].length == 0 ? 1 : snapshot.data!["comentarios"].length,
                                ),
                              ),
                            ]
                        )
                    );

                  }
                  else {
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
                }
            )
        ),
      );
    }
    else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Produto",
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
              backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

            ),
            body: FutureBuilder<Map>(
                future: _productApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {

                    // TELA DE PRODUTO QUANDO USUÁRIO É DONO
                    if(snapshot.data!["is_owner"] == "true"){
                      return Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(4, 18, 31, 1.0),
                          ),
                          child: CustomScrollView(
                              slivers: [
                                SliverToBoxAdapter(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                    Icons.arrow_back,
                                                    color: Color.fromRGBO(189, 177, 51, 1),
                                                    size: 35
                                                ),
                                                onPressed: () {
                                                  if(widget.were_from == "home"){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(widget.email, widget.password, widget.id_user, widget.username)));
                                                  }
                                                  else if (widget.were_from == "meus_produtos"){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MeusProdutos(widget.email, widget.password, widget.id_user, widget.username)));
                                                  }
                                                  else if (widget.were_from == "produtos_vtr"){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProdutosEmpresa(widget.email, widget.password, widget.id_user, widget.username)));
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 0))
                                      ],
                                    )
                                ),
                                SliverToBoxAdapter(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    child: Column(
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
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(0, 6, 0, 6)),
                                        CarouselSlider(
                                          options: CarouselOptions(),
                                          items: [
                                            "images/"+snapshot.data!["produto"]["img1"],
                                            "images/"+snapshot.data!["produto"]["img2"],
                                            "images/"+snapshot.data!["produto"]["img3"],
                                            "images/"+snapshot.data!["produto"]["img4"],
                                            "images/"+snapshot.data!["produto"]["img5"],
                                          ].map((i) {
                                            return Builder(builder: (BuildContext context) {
                                              return Container(
                                                // width: 300,
                                                height: 300,
                                                // margin: const EdgeInsets.symmetric(horizontal: 300),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset(
                                                        i,
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                          }).toList(),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                                        Text(
                                          snapshot.data!["produto"]["descricao"],
                                          style: TextStyle(
                                            color: Color.fromRGBO(159, 159, 159, 1),
                                          ),
                                        ),
                                        Container(
                                          // width: double.infinity,
                                          // height: 3000,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextButton(
                                                  onPressed: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Garantia(widget.email, widget.password, widget.username, widget.id_user, widget.id_produto, widget.were_from)));
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
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Manual(widget.email, widget.password, widget.username, widget.id_user, widget.were_from, widget.id_produto)));
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
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Transferencia(widget.email, widget.password, widget.username, widget.id_user, widget.id_produto,widget.were_from)));
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

                                                  if(text == ""){

                                                  } else {
                                                    Map<String, dynamic> data_comentario;

                                                    String url = urlApi().urlEndpoint()+"/comentario";
                                                    http.Response response;

                                                    String comentario = text;

                                                    snapshot.data!["comentarios"].insert(0, {
                                                      "Comentario": text,
                                                      "id_Usuarios": widget.id_user,
                                                      "id_Produtos": widget.id_produto,
                                                      "Nome": widget.username
                                                    });

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
                                                  }
                                                },
                                                style: TextStyle(
                                                  color: Color.fromRGBO(159, 159, 159, 1),
                                                ),
                                                keyboardType: TextInputType.text,
                                                enableSuggestions: false,
                                                autocorrect: false,
                                                decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1, color: Color.fromRGBO(92, 92, 92, 1),)),
                                                    disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1, color: Color.fromRGBO(92, 92, 92, 1),)),
                                                    label: Text(
                                                        "Escreva um comentário",
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(159, 159, 159, 1),
                                                        )
                                                    ),
                                                    border: OutlineInputBorder()
                                                ),
                                              ),
                                              Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // LISTA COMENTARIOS
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {

                                      if(snapshot.data!["comentarios"].length == 0){
                                        return Container(
                                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(4, 18, 31, 1),
                                            ),
                                            child: Card(
                                              // margin: EdgeInsets.only(bottom: 10),
                                              color: Color.fromRGBO(4, 18, 31, 1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                side: BorderSide(
                                                  width: 1,
                                                  color: Color.fromRGBO(92, 92, 92, 1),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: Column(

                                                  children: <Widget>[

                                                    ListTile(
                                                      title: Text(
                                                        "Este produto ainda não possui comentários!",
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(159, 159, 159, 1),
                                                        ),
                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            )
                                        );
                                      }
                                      else {
                                        return Container(
                                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(4, 18, 31, 1),
                                            ),
                                            child: Card(
                                              margin: EdgeInsets.only(bottom: 10),
                                              color: Color.fromRGBO(4, 18, 31, 1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                side: BorderSide(
                                                  width: 1,
                                                  color: Color.fromRGBO(92, 92, 92, 1),
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
                                                          snapshot.data!["comentarios"][index]["Nome"],
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w400,
                                                              color: Color.fromRGBO(189, 177, 51, 1)
                                                          ),
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        snapshot.data!["comentarios"][index]["Comentario"],
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(159, 159, 159, 1),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                        );
                                      }
                                    },
                                    childCount: snapshot.data!["comentarios"].length == 0 ? 1 : snapshot.data!["comentarios"].length,
                                  ),
                                ),
                              ]
                          )
                      );
                    }

                    // QUANDO NÃO É DONO
                    else {
                      return Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(4, 18, 31, 1.0),
                          ),
                          child: CustomScrollView(
                              slivers: [
                                SliverToBoxAdapter(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                    Icons.arrow_back,
                                                    color: Color.fromRGBO(189, 177, 51, 1),
                                                    size: 35
                                                ),
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(widget.email, widget.password, widget.id_user, widget.username)));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 0))
                                      ],
                                    )
                                ),
                                SliverToBoxAdapter(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Column(
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
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Arial',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(0, 6, 0, 6)),
                                        CarouselSlider(
                                          options: CarouselOptions(),
                                          items: [
                                            "images/"+snapshot.data!["produto"]["img1"],
                                            "images/"+snapshot.data!["produto"]["img2"],
                                            "images/"+snapshot.data!["produto"]["img3"],
                                            "images/"+snapshot.data!["produto"]["img4"],
                                            "images/"+snapshot.data!["produto"]["img5"],
                                          ].map((i) {
                                            return Builder(builder: (BuildContext context) {
                                              return Container(
                                                // width: 300,
                                                height: 300,
                                                // margin: const EdgeInsets.symmetric(horizontal: 300),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset(
                                                        i,
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                          }).toList(),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                                        Text(
                                          snapshot.data!["produto"]["descricao"],
                                          style: TextStyle(
                                            color: Color.fromRGBO(159, 159, 159, 1),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {

                                      if(snapshot.data!["comentarios"].length == 0){
                                        return Container(
                                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(4, 18, 31, 1),
                                            ),
                                            child: Card(
                                              // margin: EdgeInsets.only(bottom: 10),
                                              color: Color.fromRGBO(4, 18, 31, 1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                side: BorderSide(
                                                  width: 1,
                                                  color: Color.fromRGBO(92, 92, 92, 1),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: Column(

                                                  children: <Widget>[

                                                    ListTile(
                                                      title: Text(
                                                        "Este produto ainda não possui comentários!",
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(159, 159, 159, 1),
                                                        ),
                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            )
                                        );
                                      }
                                      else {
                                        return Container(
                                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(4, 18, 31, 1),
                                            ),
                                            child: Card(
                                              margin: EdgeInsets.only(bottom: 10),
                                              color: Color.fromRGBO(4, 18, 31, 1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                side: BorderSide(
                                                  width: 1,
                                                  color: Color.fromRGBO(92, 92, 92, 1),
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
                                                          snapshot.data!["comentarios"][index]["Nome"],
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w400,
                                                              color: Color.fromRGBO(189, 177, 51, 1)
                                                          ),
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        snapshot.data!["comentarios"][index]["Comentario"],
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(159, 159, 159, 1),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                        );
                                      }
                                    },
                                    childCount: snapshot.data!["comentarios"].length == 0 ? 1 : snapshot.data!["comentarios"].length,
                                  ),
                                ),
                              ]
                          )
                      );
                    }

                    // TELA DE LOADING
                  }
                  else {
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
                }
            )
        ),
      );
    }

  }
}
