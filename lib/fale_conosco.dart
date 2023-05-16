import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class FaleConosco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teste",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: null, icon: Icon(Icons.menu, color: Color.fromRGBO(189, 177, 51, 1), size: 40,),),
          title: Text(
            "Fale Conosco",
            style: TextStyle(
                color: Color.fromRGBO(189, 177, 51, 1)
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body: Container(
          color: Color.fromRGBO(4, 18, 31, 1),
        ),
      ),
    );
  }
}