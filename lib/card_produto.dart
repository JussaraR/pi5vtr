import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:pi5vtr/produto.dart';


class cardProduto extends StatefulWidget {
  //const cardProduto({Key? key}) : super(key: key);

  String email;
  String password;
  String username;
  String id_user;
  String id_produto;
  String nome_produto;
  String descricao_encurtada;
  String foto_produto;
  String were_from;


  cardProduto(this.email, this.password, this.username, this.id_user, this.id_produto, this.nome_produto, this.descricao_encurtada, this.foto_produto, this.were_from);

  @override
  State<cardProduto> createState() => _cardProdutoState();
}

class _cardProdutoState extends State<cardProduto> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Produto(widget.email, widget.password, widget.username, widget.id_produto, widget.id_user, widget.were_from)));
      },
      child: Card(
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
          padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Image.asset(
                    widget.foto_produto,
                  width: 55,
                  // height: 70,
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
                  widget.descricao_encurtada.length > 80 ? '${widget.descricao_encurtada.substring(0, 80)}...' : widget.descricao_encurtada,
                  style: TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
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
