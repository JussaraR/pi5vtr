import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<List> homeApi() async {

    Map<String, dynamic> data_home;

    List meus_produtos = [];
    List produtos = [];

    String url = "http://192.168.31.92:8080/home";
    http.Response response;

    String id_user = "3";
    String email = "robsantnev@email.com";
    String password = "password123";
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

    print(produtos);
    print(meus_produtos);
    setState(() => meus_produtos = meus_produtos);

    //return meus_produtos;

  }

  @override
  Widget build(BuildContext context) {

    Future<List> meus_produtos = homeApi();
    print("MEUS PRODUTOS");
    print(meus_produtos);

    return MaterialApp(
      title: "Teste",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: null, icon: Icon(Icons.menu, color: Color.fromRGBO(189, 177, 51, 1), size: 40,),),
          title: Text(
            "Home",
            style: TextStyle(
              fontSize: 25,
              color: Color.fromRGBO(189, 177, 51, 1),
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body:
        // SingleChildScrollView(
        //   child:
        Container(
          padding: EdgeInsets.fromLTRB(13, 15, 13, 10),
          width: double.infinity,
          height: 1000,
          decoration: BoxDecoration(
            // border: Border.all(width: 3, color: Color.fromRGBO(189, 177, 51, 1)),
            color: Color.fromRGBO(4, 18, 31, 1),
          ),
          child: Column(
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

              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: 3,
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
                                    "nome",
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
              )





              // Card(
              //   margin: EdgeInsets.only(bottom: 10),
              //   color: Color.fromRGBO(4, 18, 31, 1),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8),
              //     side: BorderSide(
              //       width: 1.5,
              //       color: Color.fromRGBO(189, 177, 51, 1),
              //     ),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
              //     child: Column(
              //       children: <Widget>[
              //         ListTile(
              //           leading: Image.asset(
              //               "images/pedal_azul2.jpg"
              //           ),
              //           title: Padding(
              //             padding: EdgeInsets.fromLTRB(0, 0, 0, 23),
              //             child: Text(
              //               'Pedal de Efeito XPTO',
              //               style: TextStyle(
              //                 fontSize: 18,
              //                   fontWeight: FontWeight.w700,
              //                   color: Color.fromRGBO(189, 177, 51, 1)
              //               ),
              //             ),
              //           ),
              //           subtitle: Text(
              //             'Pedal de efeito muito brabo XPTO',
              //             style: TextStyle(
              //                 color: Color.fromRGBO(189, 177, 51, 1)
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              // Card(
              //   margin: EdgeInsets.only(bottom: 10),
              //   color: Color.fromRGBO(4, 18, 31, 1),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8),
              //     side: BorderSide(
              //       width: 1.5,
              //       color: Color.fromRGBO(189, 177, 51, 1),
              //     ),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
              //     child: Column(
              //       children: <Widget>[
              //         ListTile(
              //           leading: Image.asset(
              //               "images/pedal_azul2.jpg"
              //           ),
              //           title: Padding(
              //             padding: EdgeInsets.fromLTRB(0, 0, 0, 23),
              //             child: Text(
              //               'Pedal de Efeito XPTO',
              //               style: TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w700,
              //                   color: Color.fromRGBO(189, 177, 51, 1)
              //               ),
              //             ),
              //           ),
              //           subtitle: Text(
              //             'Pedal de efeito muito brabo XPTO',
              //             style: TextStyle(
              //                 color: Color.fromRGBO(189, 177, 51, 1)
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Card(
              //   margin: EdgeInsets.only(bottom: 10),
              //   color: Color.fromRGBO(4, 18, 31, 1),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8),
              //     side: BorderSide(
              //       width: 1.5,
              //       color: Color.fromRGBO(189, 177, 51, 1),
              //     ),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
              //     child: Column(
              //       children: <Widget>[
              //         ListTile(
              //           leading: Image.asset(
              //               "images/pedal_azul2.jpg"
              //           ),
              //           title: Padding(
              //             padding: EdgeInsets.fromLTRB(0, 0, 0, 23),
              //             child: Text(
              //               'Pedal de Efeito XPTO',
              //               style: TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w700,
              //                   color: Color.fromRGBO(189, 177, 51, 1)
              //               ),
              //             ),
              //           ),
              //           subtitle: Text(
              //             'Pedal de efeito muito brabo XPTO',
              //             style: TextStyle(
              //                 color: Color.fromRGBO(189, 177, 51, 1)
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),














            ],
          ),
          // child: Column(
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(
          //           border: Border.all(color: Color.fromRGBO(189, 177, 51, 1)),
          //       ),
          //     )
          //   ],
          // ),



        ),
        // ),
      ),
    );
  }
}
