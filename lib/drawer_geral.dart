import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:pi5vtr/fale_conosco.dart';
import 'package:pi5vtr/login.dart';
import 'package:pi5vtr/home_produtos.dart';
import 'package:pi5vtr/sobre.dart';
import 'package:pi5vtr/meus_produtos.dart';
import 'package:pi5vtr/produtos_empresa.dart';
import 'package:pi5vtr/resgatar_produto.dart';

class drawerGeral extends StatelessWidget {
  // const drawerGeral({Key? key}) : super(key: key);

  String email;
  String password;
  String id_user;
  String username;


  drawerGeral(this.email, this.password, this.id_user, this.username);

  @override
  Widget build(BuildContext context) {
    return
    Drawer(
      backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),
      child: Column(
        children: [
          ListTile(
            title: Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 15), child: Center(child: Text("Menu", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30, color: Color.fromRGBO(189, 177, 51, 1)),))),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(92, 92, 92, 1),
                            width: 1.5
                        ),
                        top: BorderSide(
                            color: Color.fromRGBO(92, 92, 92, 1),
                            width: 1.5
                        )
                    )
                ),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(this.email, this.password, this.id_user, this.username)));
                        },
                        child: Text(
                            "Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
                        ),
                      )
                  ),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(92, 92, 92, 1),
                          width: 1.5
                      ),
                    )
                ),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MeusProdutos(this.email, this.password, this.id_user, this.username)));
                        },
                        child: Text(
                            "Meus Produtos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
                        ),
                      )
                  ),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(92, 92, 92, 1),
                          width: 1.5
                      ),
                    )
                ),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProdutosEmpresa(this.email, this.password, this.id_user, this.username)));
                        },
                        child: Text(
                            "Produtos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
                        ),
                      )
                  ),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(92, 92, 92, 1),
                          width: 1.5
                      ),
                    )
                ),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreEmpresa(this.email, this.password, this.username, this.id_user)));
                        },
                        child: Text(
                            "Sobre", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
                        ),
                      )
                  ),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(92, 92, 92, 1),
                          width: 1.5
                      ),
                    )
                ),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FaleConosco(this.email, this.password, this.username, this.id_user)));
                        },
                        child: Text(
                            "Fale Conosco", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
                        ),
                      )
                  ),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(92, 92, 92, 1),
                          width: 1.5
                      ),
                    )
                ),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ResgatarProd(this.email, this.password, this.username, this.id_user)));
                        },
                        child: Text(
                            "Resgatar Produto", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(189, 177, 51, 1))
                        ),
                      )
                  ),
                )
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: ElevatedButton(
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop(context);
              },
              child: Text(
                "Sair",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Arial',
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.fromLTRB(30, 7, 30, 7)
                ),
                backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(189, 177, 51, 1)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
