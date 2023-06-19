import 'package:pi5vtr/home_produtos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:pi5vtr/cadastro.dart';


class telaLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String mensagemErro = "";

  erroLogin(String mensagem){
    setState(() {
      mensagemErro = mensagem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Teste",
        home: Scaffold(
            body: SingleChildScrollView(
                child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.fromLTRB(15, 50, 15, 20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(4, 18, 31, 1.0),
                        ),
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "VTR Effects",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(189, 177, 51, 1)
                              ),
                            ),
                            Image.asset(
                              "images/vtr_logo.png",
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                mensagemErro,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.5,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            TextField(
                              controller: _emailController,
                              style: TextStyle(
                                color: Color.fromRGBO(159, 159, 159, 1),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1),)),
                                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1),)),
                                  label: Text(
                                      "Email",
                                      style: TextStyle(
                                        color: Color.fromRGBO(159, 159, 159, 1),
                                      )
                                  ),
                                  border: OutlineInputBorder()
                              ),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            TextField(
                              controller: _passwordController,
                              style: TextStyle(
                                color: Color.fromRGBO(159, 159, 159, 1),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1),)),
                                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1),)),
                                  label: Text(
                                      "Senha",
                                      style: TextStyle(
                                        color: Color.fromRGBO(159, 159, 159, 1),
                                      )
                                  ),
                                  border: OutlineInputBorder()
                              ),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Home("", "", "", "")));
                              },
                              child: const Text(
                                'Entrar sem uma conta',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.5,
                                    decorationStyle: TextDecorationStyle.solid,
                                    color: Color.fromRGBO(189, 177, 51, 0.8)
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),),

                            Spacer(),
                            Container(
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {

                                      if(_emailController.text.isEmpty && _passwordController.text.isEmpty){
                                        erroLogin("Digite os dados da conta");
                                      } else if(_emailController.text.isEmpty){
                                        erroLogin("Digite um email");
                                      } else if(_passwordController.text.isEmpty){
                                        erroLogin("Digite a senha");
                                      } else {

                                        Map<String, dynamic> data_login;

                                        String url = "http://192.168.31.92:8080/login";
                                        // String url = "https://8bbe-168-181-126-193.ngrok-free.app/login";

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

                                          erroLogin(data_login["message"]);

                                        } else if (data_login["status_code"] == 200){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(data_login["email"], data_login["password"], data_login["id_user"], data_login["username"])));
                                        }
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
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.5,
                                            decoration: TextDecoration.none,
                                            color: Color.fromRGBO(189, 177, 51, 0.8)
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle: const TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
                                        },
                                        child: const Text(
                                          'Registre-se',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.5,
                                            decoration: TextDecoration.underline,
                                            color: Color.fromRGBO(189, 177, 51, 0.8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

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
