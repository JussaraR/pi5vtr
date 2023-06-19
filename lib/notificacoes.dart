import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pi5vtr/fale_conosco.dart';
import 'package:pi5vtr/login.dart';
import 'package:pi5vtr/home_produtos.dart';
import 'package:pi5vtr/sobre.dart';
import 'package:pi5vtr/meus_produtos.dart';
import 'package:pi5vtr/produtos_empresa.dart';
import 'package:pi5vtr/resgatar_produto.dart';


class Notificacoes extends StatefulWidget {

  String email;
  String password;
  String username;
  String id_user;
  List notificacoes;

  Notificacoes(this.email, this.password, this.username, this.id_user, this.notificacoes);

  @override
  State<Notificacoes> createState() => _NotificacoesState();
}



class _NotificacoesState extends State<Notificacoes> {
  @override
  Widget build(BuildContext context) {

    // NOTIFICAÇÕES OFFLINE
    if(widget.username == "" && widget.email == "" && widget.password == ""){
      return MaterialApp(
        title: "Notificações",
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
                "Notificações",
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
                    "Faça login e veja suas notificações!",
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



    return MaterialApp(
      title: "Teste",
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
            "Notificações",
            style: TextStyle(
                color: Color.fromRGBO(189, 177, 51, 1)
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(4, 18, 31, 1.0),
          ),
        child:
          CustomScrollView(
              slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Card(
                        margin: EdgeInsets.only(bottom: 10),
                        color: Color.fromRGBO(4, 18, 31, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            width: 1.5,
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
                                    widget.notificacoes[index]["titulo_notificacao"],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(189, 177, 51, 1)
                                    ),
                                  ),
                                ),
                                subtitle: Text(
                                  widget.notificacoes[index]["texto_notificacao"],
                                  style: TextStyle(
                                      color: Color.fromRGBO(159, 159, 159, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: widget.notificacoes.length,
                  ),
                ),
            ]
          )
        )


        // Container(
        //   padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
        //   width: double.infinity,
        //   height: MediaQuery.of(context).size.height,
        //   decoration: BoxDecoration(
        //     //border: Border.all(width: 3, color: Color.fromRGBO(189, 177, 51, 1)),
        //     color: Color.fromRGBO(4, 18, 31, 1),
        //   ),
        //   child: Center(
        //     child: ListView(
        //         children: [
        //           Text(
        //               "data",
        //               style: TextStyle(
        //                   color: Color.fromRGBO(189, 177, 51, 1)
        //             ),
        //           )
        //         ],
        //       ),
        //     )
        // )
      ),
    );
  }
}
