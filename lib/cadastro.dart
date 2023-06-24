import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:pi5vtr/login.dart';
import 'package:pi5vtr/url_api.dart';



class Cadastro extends StatefulWidget {

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  TextEditingController _cpfCnpjController = TextEditingController();

  String mensagemErro = "";

  erroCriarConta(String mensagem){
    setState(() {
      mensagemErro = mensagem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Cadastrar",
        home: Scaffold(
            body: SingleChildScrollView(
                child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(10, 40, 10, 20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(4, 18, 31, 1.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
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
                                          Navigator.of(context, rootNavigator: true).pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                  // Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 25),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Text(
                                        "Criar Conta",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(189, 177, 51, 1)
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),





                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    mensagemErro,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                  TextField(
                                    controller: _usernameController,
                                    style: TextStyle(
                                      color: Color.fromRGBO(159, 159, 159, 1),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                                        label: Text(
                                            "Username",
                                            style: TextStyle(
                                              color: Color.fromRGBO(159, 159, 159, 1),
                                            )
                                        ),
                                        border: OutlineInputBorder()
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                                  TextField(
                                    controller: _cpfCnpjController,
                                    style: TextStyle(
                                      color: Color.fromRGBO(159, 159, 159, 1),
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                                        label: Text(
                                            "CPF/CNPJ",
                                            style: TextStyle(
                                              color: Color.fromRGBO(159, 159, 159, 1),
                                            )
                                        ),
                                        border: OutlineInputBorder()
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                                  TextField(
                                    controller: _emailController,
                                    style: TextStyle(
                                      color: Color.fromRGBO(159, 159, 159, 1),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                                        label: Text(
                                            "E-mail",
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
                                    onChanged: (text){

                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                                        label: Text(
                                            "Senha",
                                            style: TextStyle(
                                              color: Color.fromRGBO(159, 159, 159, 1),
                                            )
                                        ),
                                        border: OutlineInputBorder()
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                                  TextField(
                                    controller: _passwordConfirmController,
                                    onChanged: (text){
                                      if(_passwordConfirmController.text != _passwordController.text){
                                        erroCriarConta("Digite senhas iguais");
                                      }else if (text.isEmpty){
                                        erroCriarConta("");
                                      }
                                      else {
                                        erroCriarConta("");
                                      }
                                    },
                                    style: TextStyle(
                                      color: Color.fromRGBO(159, 159, 159, 1),
                                    ),
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid, width: 1.5, color: Color.fromRGBO(92, 92, 92, 1))),
                                        label: Text(
                                            "Confirmar Senha",
                                            style: TextStyle(
                                              color: Color.fromRGBO(159, 159, 159, 1),
                                            )
                                        ),
                                        border: OutlineInputBorder()
                                    ),
                                  ),                            // Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
                                ],
                              ),
                            ),





                            // Spacer(),





                            Container(
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {

                                      Map<String, dynamic> data_login;

                                      String url = urlApi().urlEndpoint()+"/criarconta";
                                      // String url = "https://69c4-168-181-126-193.ngrok-free.app/criarconta";
                                      http.Response response;

                                      String email = _emailController.text;
                                      String password = _passwordController.text;
                                      String username = _usernameController.text;
                                      String cpf_cnpj = _cpfCnpjController.text;
                                      String data_nascimento = "";

                                      if(_usernameController.text.isEmpty || _cpfCnpjController.text.isEmpty ||  _emailController.text.isEmpty || _passwordController.text.isEmpty || _passwordConfirmController.text.isEmpty){
                                        erroCriarConta("Digite os dados da conta");
                                      } else {

                                        Map<String, String> header = {
                                          'Content-Type': 'application/json; charset=UTF-8',
                                        };

                                        response = await http.post(
                                          url,
                                          headers: header,
                                          body: jsonEncode(<String, String>{
                                            'email': email,
                                            'password': password,
                                            'data_nascimento': data_nascimento,
                                            'nome': username,
                                            'cpf_cnpj':  cpf_cnpj
                                          }),
                                        );

                                        data_login = json.decode(response.body);
                                        print(data_login);

                                        if (data_login["status_code"] == 404){
                                          erroCriarConta(data_login["message"]);
                                        } else if (data_login["status_code"] == 200){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                        }
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
