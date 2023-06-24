import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pi5vtr/login.dart';
import 'package:pi5vtr/drawer_geral.dart';
import 'package:pi5vtr/url_api.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:pi5vtr/home_produtos.dart';


class Notificacoes extends StatefulWidget {

  String email;
  String password;
  String username;
  String id_user;

  Notificacoes(this.email, this.password, this.username, this.id_user);

  @override
  State<Notificacoes> createState() => _NotificacoesState();
}



class _NotificacoesState extends State<Notificacoes> {

  Future<Map> _notificacoes() async {

    Map<String, dynamic> data_notificacao;

    String url = urlApi().urlEndpoint()+"/notificacoes";
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
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'password': password,
        'id_user': id_user
      }),
    );

    data_notificacao = json.decode(response.body);

    return data_notificacao;
  }


  @override
  Widget build(BuildContext context) {

    // NOTIFICAÇÕES OFFLINE
    if(widget.username == "" && widget.email == "" && widget.password == ""){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Notificações",
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
            "Notificações",
            style: TextStyle(
                color: Color.fromRGBO(189, 177, 51, 1),
              fontSize: 25,
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(4, 18, 31, 1.0),
          ),
        child:
        FutureBuilder<Map>(
          future: _notificacoes(),
          builder: (context, snapshot){

          if(snapshot.hasData){
            return CustomScrollView(
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
                        Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5))
                      ],
                    )
                  ),
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
                                      snapshot.data!["notificacoes"][index]["titulo_notificacao"],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(189, 177, 51, 1)
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    snapshot.data!["notificacoes"][index]["texto_notificacao"],
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
                      childCount: snapshot.data!["notificacoes"].length,
                    ),
                  ),
                ]
            );
          } else {
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


        }),
        )
      ),
    );
  }
}
