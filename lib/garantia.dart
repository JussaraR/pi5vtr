import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:pi5vtr/drawer_geral.dart';
import 'package:pi5vtr/url_api.dart';
import 'package:pi5vtr/produto.dart';


class Garantia extends StatefulWidget {

  String email;
  String password;
  String username;
  String id_produto;
  String id_user;
  String were_from;

  Garantia(this.email, this.password, this.username, this.id_user, this.id_produto, this.were_from);

  @override
  State<Garantia> createState() => _GarantiaState();
}

class _GarantiaState extends State<Garantia> {


  Future<Map> _garantiaApi() async {

    Map<String, dynamic> data_garantia;

    String url = urlApi().urlEndpoint()+"/garantia";
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
      debugShowCheckedModeBanner: false,
      title: "Garantia",
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
            "Garantia",
            style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(189, 177, 51, 1)
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Color.fromRGBO(4, 18, 31, 1),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                        Icons.arrow_back,
                        color: Color.fromRGBO(189, 177, 51, 1),
                        size: 35
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Produto(widget.email, widget.password, widget.username, widget.id_produto, widget.id_user, widget.were_from)));
                    },
                  ),
                ],
              ),

              Text(
                  "A garantia dos produtos VTR Effects é vitalícia para o primeiro dono, sendo válida para os próximos donos do mesmo produto estando dentro do período de 1 ano da data da compra.",
                style: TextStyle(
                    color: Color.fromRGBO(159, 159, 159, 1),
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),

              FutureBuilder<Map>(
              future: _garantiaApi(),
              builder: (context, snapshot) {

                if(snapshot.hasData){
                  return Row(
                    children: [
                      Text(
                        snapshot.data!["message"],
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(159, 159, 159, 1),
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
