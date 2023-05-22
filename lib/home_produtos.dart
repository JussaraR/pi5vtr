import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);
  String email;
  String password;
  String id_user;

  Home(this.email, this.password, this.id_user);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List meus_produtos = [];
  List produtos = [];

  Future<Map> homeApi() async {

    Map<String, dynamic> data_home;

    String url = "http://192.168.31.92:8080/home";
    http.Response response;

    String id_user = widget.id_user;
    String email = widget.email;
    String password = widget.password;

    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    response = await http.post(
      url,
      headers: header,
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'id_user': id_user
      }),
    );

    data_home = json.decode(response.body);

    for(int i =0; i < data_home["meus_produtos"].length; i++){
      meus_produtos.add(data_home["meus_produtos"][i]);
    };
    for(int i =0; i < data_home["produtos"].length; i++){
      produtos.add(data_home["produtos"][i]);
    }

    return data_home;

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Teste",
      home: Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            centerTitle: true,
            //leading: IconButton(onPressed: null, icon: Icon(Icons.menu, color: Color.fromRGBO(189, 177, 51, 1), size: 40,),),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(189, 177, 51, 1),
              ),
            ),
            backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

          ),
          body: FutureBuilder<Map>(
            future: homeApi(),
            builder: (context, snapshot){

              if(snapshot.hasData){

                if(snapshot.data!["meus_produtos"] != [] && snapshot.data!["produtos"] != []){
                  print("TEM TODOS");
                  print(snapshot.data);

                  return SingleChildScrollView( child: Container(
                    padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
                    width: double.infinity,
                   //height: 800,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      //border: Border.all(width: 3, color: Color.fromRGBO(189, 177, 51, 1)),
                      color: Color.fromRGBO(4, 18, 31, 1),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(
                              "Meus Produtos",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Color.fromRGBO(189, 177, 51, 1)
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),





                        Container(
                          height: 300,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!["meus_produtos"].length,
                              itemBuilder: (context, indice){
                                return Card(
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
                                              "images/pedal_azul2.jpg"
                                          ),
                                          title: Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 0, 23),
                                            child: Text(
                                              snapshot.data!["meus_produtos"][indice]["nome_produto"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(189, 177, 51, 1)
                                              ),
                                            ),
                                          ),
                                          subtitle: Text(
                                            'Pedal de efeito muito brabo XPTO',
                                            style: TextStyle(
                                                color: Color.fromRGBO(189, 177, 51, 1)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(
                              "Produtos",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Color.fromRGBO(189, 177, 51, 1)
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                        Container(
                          height: 400,
                          //height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!["produtos"].length,
                              itemBuilder: (context, indice){
                                return Card(
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
                                              "images/pedal_azul2.jpg"
                                          ),
                                          title: Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 0, 23),
                                            child: Text(
                                              snapshot.data!["produtos"][indice]["nome_produto"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(189, 177, 51, 1)
                                              ),
                                            ),
                                          ),
                                          subtitle: Text(
                                            'Pedal de efeito muito brabo XPTO',
                                            style: TextStyle(
                                                color: Color.fromRGBO(189, 177, 51, 1)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),


                      ],
                    ),
                  ));

                } else if(snapshot.data!["meus_produtos"] == []){
                    return Container(
                      height: 400,
                      //height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!["produtos"].length,
                          itemBuilder: (context, indice){
                            return Card(
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
                                          "images/pedal_azul2.jpg"
                                      ),
                                      title: Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 23),
                                        child: Text(
                                          snapshot.data!["produtos"][indice]["nome_produto"],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(189, 177, 51, 1)
                                          ),
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Pedal de efeito muito brabo XPTO',
                                        style: TextStyle(
                                            color: Color.fromRGBO(189, 177, 51, 1)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    );
                }

              }
              return Text("snapshot.data.toString()");
            }
          )
      ),
    );
  }
}