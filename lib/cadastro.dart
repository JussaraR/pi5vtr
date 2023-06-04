import 'package:pi5vtr/home_produtos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class Cadastro extends StatefulWidget {

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  String mensagemErro = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Teste",
        home: Scaffold(
          // appBar: ,
            body: SingleChildScrollView(
                child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(4, 18, 31, 1.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Image.asset(
                            //   "images/vtr_logo.png",
                            // ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                              child: Text(
                                "Criar Conta",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(189, 177, 51, 1)
                                ),
                              ),
                            ),
                            TextField(
                              controller: _usernameController,
                              style: TextStyle(
                                color: Color.fromRGBO(189, 177, 51, 1),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(189, 177, 51, 1))),
                                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(189, 177, 51, 1))),
                                  label: Text(
                                      "Username",
                                      style: TextStyle(
                                        color: Color.fromRGBO(189, 177, 51, 0.7),
                                      )
                                  ),
                                  border: OutlineInputBorder()
                              ),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            TextField(
                              controller: _emailController,
                              style: TextStyle(
                                color: Color.fromRGBO(189, 177, 51, 1),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(189, 177, 51, 1))),
                                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(189, 177, 51, 1))),
                                  label: Text(
                                      "E-mail",
                                      style: TextStyle(
                                        color: Color.fromRGBO(189, 177, 51, 0.7),
                                      )
                                  ),
                                  border: OutlineInputBorder()
                              ),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            TextField(
                              controller: _passwordController,
                              style: TextStyle(
                                color: Color.fromRGBO(189, 177, 51, 1),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              onChanged: (text){

                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(189, 177, 51, 1))),
                                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(189, 177, 51, 1))),
                                  label: Text(
                                      "Senha",
                                      style: TextStyle(
                                        color: Color.fromRGBO(189, 177, 51, 0.7),
                                      )
                                  ),
                                  border: OutlineInputBorder()
                              ),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            TextField(
                              controller: _passwordConfirmController,
                              style: TextStyle(
                                color: Color.fromRGBO(189, 177, 51, 1),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(189, 177, 51, 1))),
                                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(189, 177, 51, 1))),
                                  label: Text(
                                      "Confirmar Senha",
                                      style: TextStyle(
                                        color: Color.fromRGBO(189, 177, 51, 0.7),
                                      )
                                  ),
                                  border: OutlineInputBorder()
                              ),
                            ),                            // Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
                            Padding(padding: EdgeInsets.fromLTRB(0, 35, 0, 32),),

                            ElevatedButton(
                              onPressed: () async {

                                Map<String, dynamic> data_login;

                                String url = "http://192.168.31.92:8080/login";
                                http.Response response;

                                String email = _emailController.text;
                                String password = _passwordController.text;

                                Map<String, String> header = {
                                  'Content-Type': 'application/json; charset=UTF-8',
                                };

                                response = await http.post(
                                  url,
                                  headers: header,
                                  body: jsonEncode(<String, String>{
                                    'email': email,
                                    'password': password,
                                  }),
                                );

                                data_login = json.decode(response.body);
                                print(data_login);

                                if (data_login["status_code"] == 404){
                                  //MENSAGEM CASO LOGIN FALHE
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      action: SnackBarAction(
                                        label: 'Action',
                                        onPressed: () {
                                          // Code to execute.
                                        },
                                      ),
                                      content: const Text('Verifique seu email/senha.'),
                                      duration: const Duration(milliseconds: 1500),
                                      width: 280.0, // Width of the SnackBar.
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, // Inner padding for SnackBar content.
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  );
                                } else if (data_login["status_code"] == 200){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(data_login["email"], data_login["password"], data_login["id_user"])));
                                }
                              },
                              child: Text(
                                "Criar",
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
                            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 8)),
                          ],
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }
}
