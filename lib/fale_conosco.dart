import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pi5vtr/drawer_geral.dart';

class FaleConosco extends StatefulWidget {
  //const FaleConosco({Key? key}) : super(key: key);

  String email;
  String password;
  String username;
  String id_user;

  FaleConosco(this.email, this.password, this.username, this.id_user);

  @override
  State<FaleConosco> createState() => _FaleConoscoState();
}

class _FaleConoscoState extends State<FaleConosco> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Teste",
      home: Scaffold(
        drawer: drawerGeral(widget.email, widget.password, widget.id_user, widget.username),
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(builder: (BuildContext context){
            return IconButton(
              icon: const Icon(Icons.menu, color: Color.fromRGBO(189, 177, 51, 1), size: 40,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },),
          title: Text(
            "Fale Conosco",
            style: TextStyle(
                color: Color.fromRGBO(189, 177, 51, 1)
            ),
          ),
          backgroundColor: Color.fromRGBO(4, 18, 31, 1.0),

        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          color: Color.fromRGBO(4, 18, 31, 1),
          child: Column(
            children: [

              GestureDetector(
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
                          // FOTO
                          leading: Icon(FontAwesomeIcons.chrome, color: Color.fromRGBO(189, 177, 51, 1), size: 40,),
                          title: Text(
                            "Site",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(189, 177, 51, 1)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () async {
                  final Uri url = Uri.parse("https://vtreffects.com.br/");
                  await launchUrl(url);
                },
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
              GestureDetector(
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
                          // FOTO
                          leading: Icon(FontAwesomeIcons.instagram, color: Colors.purpleAccent, size: 40,),
                          title: Text(
                            "Instagram",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(189, 177, 51, 1)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () async {
                  final Uri url = Uri.parse("https://www.instagram.com/vtreffects/");
                  await launchUrl(url);
                },
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
              GestureDetector(
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
                      children: [
                        ListTile(
                          // FOTO
                          leading: Icon(FontAwesomeIcons.facebook, color: Colors.blueAccent, size: 40,),
                          title: Text(
                            "Facebook",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(189, 177, 51, 1)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () async {
                  final Uri url = Uri.parse("https://www.facebook.com/vtreffects");
                  await launchUrl(url);
                },
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
              GestureDetector(
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
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: Icon(FontAwesomeIcons.youtube, color: Colors.red, size: 40,),
                          title: Text(
                            "Youtube",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(189, 177, 51, 1)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () async {
                  final Uri url = Uri.parse("https://www.youtube.com/channel/UC8iMcPCRQ4hOJqsdQ5tgN7A");
                  await launchUrl(url);
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}