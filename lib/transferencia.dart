import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:pi5vtr/home_produtos.dart';
import 'package:pi5vtr/url_api.dart';
import 'package:pi5vtr/drawer_geral.dart';
import 'package:pi5vtr/produto.dart';


class Transferencia extends StatefulWidget {

  String id_user;
  String id_produto;
  String username;
  String email;
  String password;
  String were_from;

  Transferencia(this.email, this.password, this.username, this.id_user, this.id_produto, this.were_from);

  @override
  State<Transferencia> createState() => _TransferenciaState();
}

class _TransferenciaState extends State<Transferencia> {

  TextEditingController _emailNextOwnerController = TextEditingController();

  String mensagemErro = "";

  erroTransferencia(String mensagem){
    setState(() {
      mensagemErro = mensagem;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Transferência",
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
        body: SingleChildScrollView(child:Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
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
              Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  "Transferência de Produto",
                  style: TextStyle(
                      fontSize: 23,
                      color: Color.fromRGBO(189, 177, 51, 1),
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                child: Text(
                  "Ao transferir seu produto para outro usuário, você também transfere sua garantia para o novo dono e o produto deixará de listar para você como dono.",
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
              Padding(
                padding: EdgeInsets.fromLTRB(10, 100, 10, 85),
                child: TextField(
                  controller: _emailNextOwnerController,
                  style: TextStyle(
                    color: Color.fromRGBO(189, 177, 51, 1),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                      disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                      label: Text(
                          "E-mail novo dono",
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

                  if(_emailNextOwnerController.text.isEmpty){

                  } else {

                    Map<String, dynamic> data_transfer;

                    String url = urlApi().urlEndpoint()+"/transferencia";

                    http.Response response;

                    String email = widget.email;
                    String password = widget.password;
                    String id_user = widget.id_user;
                    String id_produto = widget.id_produto;
                    String email_novo_dono = _emailNextOwnerController.text;

                    Map<String, String> header = {
                      'Content-Type': 'application/json; charset=UTF-8',
                    };

                    response = await http.post(
                      url,
                      headers: header,
                      body: jsonEncode(<String, String>{
                        'email': email,
                        'password': password,
                        'id_atual_user': id_user,
                        'email_prox_user': email_novo_dono,
                        'id_produto': id_produto
                      }),
                    );
                    data_transfer = json.decode(response.body);
                    print(data_transfer);
                    if(data_transfer["status_code"] == 200){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Home(widget.email, widget.password, widget.id_user, widget.username)));
                    } else {
                      erroTransferencia(data_transfer["message"]);
                    }
                  }
                },
                child: Text(
                  "Transferir",
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
        ),),
      ),
    );
  }
}
