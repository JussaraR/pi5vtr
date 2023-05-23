import 'package:pi5vtr/home_produtos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";


class telaPrincipalState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}


class Login extends StatelessWidget {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Teste",
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(4, 18, 31, 1.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "VTR Effects",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w100,
                            color: Color.fromRGBO(189, 177, 51, 1)
                        ),
                      ),
                      Image.asset(
                        "images/vtr_logo.png",
                      ),
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
                                "Email",
                                style: TextStyle(
                                  color: Color.fromRGBO(189, 177, 51, 1),
                                )
                            ),
                            border: OutlineInputBorder()
                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
                      TextField(
                        controller: _passwordController,
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
                                "Senha",
                                style: TextStyle(
                                  color: Color.fromRGBO(189, 177, 51, 1),
                                )
                            ),
                            border: OutlineInputBorder()
                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
                      Text(
                        "Entrar sem uma conta",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                            letterSpacing: -0.5,
                            decorationStyle: TextDecorationStyle.solid,
                            color: Color.fromRGBO(189, 177, 51, 1)
                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 30),),

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
                          "Entrar",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Não possui uma conta? ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                letterSpacing: -0.5,
                                decoration: TextDecoration.none,
                                color: Color.fromRGBO(189, 177, 51, 1)
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: null,
                            child: const Text(
                              'Registre-se',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                letterSpacing: -0.5,
                                decorationStyle: TextDecorationStyle.solid,
                                color: Color.fromRGBO(189, 177, 51, 1),
                              ),
                            ),
                          ),
                        ],
                      )
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