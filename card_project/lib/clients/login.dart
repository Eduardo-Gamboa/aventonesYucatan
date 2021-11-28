import 'package:card_project/clients/ui/home/home_page.dart';
import 'package:flutter/material.dart';
// import 'controllers/info.dart';
// import 'controllers/login.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
// import 'index.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Login> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  var mensaje = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff343a40),
        appBar: AppBar(
          backgroundColor: const Color(0xffBAE900),
          title: const Text('Aventones'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    '/img/aventones.png',
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Raleway'),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text(mensaje,
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xffBAE900),
                      child: Text('Iniciar',
                          style: TextStyle(
                              color: Color(0xff343a40),
                              fontFamily: 'Raleway bold')),
                      onPressed: () {
                        // TODO:: LOGIN CON EL API
                        setState(() {
                          _loginvalidate(context);
                        });
                        // print(nameController.text);
                        // print(passwordController.text);
                      },
                    )),
                // Container(
                //     child: Row(
                //   children: <Widget>[
                //     OutlinedButton(
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               // builder: (context) => MyApp2(),
                //             ),
                //           );
                //         },
                //         child: const Text('Obtener Mi IDANDROID',
                //             style: TextStyle(
                //                 color: Colors.white,
                //                 fontFamily: 'Raleway bold'))),
                //     FlatButton(
                //       textColor: Colors.blue,
                //       child: Text(
                //         'Registrar',
                //         style: TextStyle(
                //             fontSize: 20,
                //             color: Colors.white,
                //             fontFamily: 'Raleway bold'),
                //       ),
                //       onPressed: () {
                //         //signup screen
                //       },
                //     )
                //   ],
                //   mainAxisAlignment: MainAxisAlignment.center,
                // ))
              ],
            )));
  }

  void _loginvalidate(BuildContext context) {
    Future<http.Response> createcontact(
      String androidId,
      String pass,
    ) async {
      final response = await http.post(
        // Cambia la url que te digo

        Uri.parse('http://jesusloeza.xyz/api/loginclients'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'androidId': androidId,
          'pass': pass,
        }),
      );
      if (response.statusCode == 200) {
        print(response.body);
        if (response.body == 'error de contraseña') {
          mensaje = 'error de contraseña';
        }
        if (response.body == 'No existe este dispositivo') {
          mensaje = 'No existe este dispositivo';
        }
        if (response.body == 'Error01') {
          mensaje = '';

          mensaje = 'Algun campo esta vacio';
        }
        var success = response.body;
        var dato = success.split("-");
        if (dato[0] == 'Successfull') {
          var idDriver = dato[1];
          print(idDriver);
          // si todo sale bien aqui pones tu vista que iniciara y pasas la id
          //del cliente deja el id_driver es lo mismo solo que en tu vista
          //lo recibes y ya cambias los link estadicos de id por la id_driver
          //para que traiga sus datos.
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage(idDriver)));
        }
      } else {
        throw Exception('Error:' " " + response.statusCode.toString());
      }
      return response;
    }

// agarra los valores de los formularios y los envia a la url
    createcontact(this.nameController.text, this.passwordController.text);
  }
}
