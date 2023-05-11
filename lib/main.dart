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

      ),
    );
  }
}






// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Teste",
//       home: Scaffold(
//         body: Container(
//           padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
//           decoration: BoxDecoration(
//             color: Color.fromRGBO(4, 18, 31, 1.0),
//           ),
//           // color: Colors.white,
//           child: Column(
//             children: [
//               Text(
//                 "VTR Effects",
//                 style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w100,
//                     // decoration: TextDecoration.none,
//                     color: Color.fromRGBO(189, 177, 51, 1)
//                 ),
//               ),
//               Image.asset(
//                 "images/vtr_logo.png",
//                 // height: 250.0,
//                 // width: 700.0,
//               ),
//               const TextField(
//                 decoration: InputDecoration(
//                   label: Text(
//                       "Email",
//                       style: TextStyle(
//                         color: Color.fromRGBO(189, 177, 51, 1),
//                       )
//                   ),
//                   border: OutlineInputBorder()
//                 ),
//               ),
//               Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
//               const TextField(
//                 decoration: InputDecoration(
//                     label: Text(
//                         "Senha",
//                         style: TextStyle(
//                           color: Color.fromRGBO(189, 177, 51, 1),
//                         ),
//                     ),
//                     border: OutlineInputBorder(),
//                 ),
//                 style: TextStyle(
//                   color: Color.fromRGBO(189, 177, 51, 1)
//                 ),
//               ),
//               Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
//               Text(
//                 "Entrar sem uma conta",
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w100,
//                     letterSpacing: -0.5,
//                     // decoration: TextDecoration.none,
//                     decorationStyle: TextDecorationStyle.solid,
//                     color: Color.fromRGBO(189, 177, 51, 1)
//                 ),
//               ),
//               Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 30)),
//
//               ElevatedButton(
//                 onPressed: null,
//                 child: Text(
//                   "Entrar",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: 'Arial',
//                   ),
//                 ),
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all(
//                       EdgeInsets.fromLTRB(30, 13, 30, 13)
//                   ),
//                   backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(189, 177, 51, 1)),
//                   // padding: 30,
//                 ),
//               ),
//               Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Não possui uma conta? ",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w100,
//                         letterSpacing: -0.5,
//                         decoration: TextDecoration.none,
//                         color: Color.fromRGBO(189, 177, 51, 1)
//                     ),
//                   ),
//                   TextButton(
//                     style: TextButton.styleFrom(
//                       textStyle: const TextStyle(fontSize: 20),
//                     ),
//                     onPressed: null,
//                     child: const Text(
//                       'Registre-se',
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w100,
//                         letterSpacing: -0.5,
//                         // decoration: TextDecoration.none,
//                         decorationStyle: TextDecorationStyle.solid,
//                         color: Color.fromRGBO(189, 177, 51, 1),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }