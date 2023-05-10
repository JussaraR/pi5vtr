import 'package:flutter/material.dart';

void main(){
  runApp(
      MyApp()
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teste",
      home: Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(4, 18, 31, 1.0),
            ),
            // color: Colors.white,
            child: Column(
                children: [
                  Text(
                    "VTR Effects",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                        // decoration: TextDecoration.none,
                        color: Color.fromRGBO(189, 177, 51, 1)
                    ),
                  ),
                  Image.asset(
                    "images/vtr_logo.png",
                    height: 250.0,
                    width: 700.0,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text("Email"),
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text("Senha"),
                    ),
                  ),
                  Text(
                    "Entrar sem uma conta",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        letterSpacing: -0.5,
                        // decoration: TextDecoration.none,
                        decorationStyle: TextDecorationStyle.solid,
                        color: Color.fromRGBO(189, 177, 51, 1)
                    ),
                  ),
                  // Text(
                  //   "Não possui uma conta? Registre-se",
                  //   style: TextStyle(
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.w100,
                  //       letterSpacing: -0.5,
                  //       // decoration: TextDecoration.none,
                  //       decorationStyle: TextDecorationStyle.solid,
                  //       color: Color.fromRGBO(189, 177, 51, 1)
                  //   ),
                  // ),
                  FloatingActionButton(
                    onPressed: null, child: Text("Entrar"),
                    backgroundColor: Color.fromRGBO(189, 177, 51, 1),
                  ),
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
                      Text(
                        "Registre-se",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          letterSpacing: -0.5,
                          // decoration: TextDecoration.none,
                          decorationStyle: TextDecorationStyle.solid,
                          color: Color.fromRGBO(189, 177, 51, 1),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
      ),


    );
  }
}