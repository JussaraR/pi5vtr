import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pi5vtr/fale_conosco.dart';
import "dart:convert";
import 'package:pi5vtr/manual.dart';
import 'package:pi5vtr/garantia.dart';
import 'package:pi5vtr/produto.dart';
import 'package:pi5vtr/login.dart';
import 'package:pi5vtr/home_produtos.dart';
import 'package:pi5vtr/sobre.dart';


class cardProduto extends StatefulWidget {
  //const cardProduto({Key? key}) : super(key: key);

  String email;
  String password;

  //usados para consulta na pagina de produto
  String id_user;
  String id_produto;
  String is_owner;

  //usados para construir o card
  String nome_produto;
  String descricao_encurtada;
  String foto_produto;
  //String descricao_pequena


  cardProduto(this.email, this.password, this.id_user, this.id_produto, this.nome_produto, this.descricao_encurtada, this.foto_produto, this.is_owner);

  @override
  State<cardProduto> createState() => _cardProdutoState();
}

class _cardProdutoState extends State<cardProduto> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Produto(widget.email, widget.password, widget.id_produto, widget.id_user, widget.is_owner)));
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 10),
        color: Color.fromRGBO(4, 18, 31, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            width: 1.5,
            color: Color.fromRGBO(189, 177, 51, 1),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Image.asset(
                    widget.foto_produto
                ),
                title: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 23),
                  child: Text(
                    widget.nome_produto,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(189, 177, 51, 1)
                    ),
                  ),
                ),
                subtitle: Text(
                  widget.descricao_encurtada,
                  style: TextStyle(
                      color: Color.fromRGBO(189, 177, 51, 1)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
