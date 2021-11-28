import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'class/profile.dart';
import 'dart:convert' as convert;
import 'newviaje.dart';
import 'misviajes.dart';
import 'notificaciones.dart';

class Index extends StatefulWidget {
  String id_driver;
  Index(this.id_driver);
  var _id = 0;
  @override
  State<StatefulWidget> createState() {
    return BienvenidaState(this.id_driver);
  }
}

class BienvenidaState extends State<Index> {
  String id_driver;
  BienvenidaState(this.id_driver);

  var _postJson = [];
  void fectPosts() async {
    try {
      final response = await http
          .get(Uri.parse('http://jesusloeza.xyz/api/drivers?id=' + id_driver));
      final jsonData = jsonDecode(response.body);
      setState(() {
        _postJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    fectPosts();
  }

  @override
  Widget build(BuildContext context) {
    final post = _postJson[0];
    final id = widget.id_driver;

    return MaterialApp(
      title: 'Aventones',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff343a40),
          title: new Image.asset(
            '/img/aventones.png',
            height: 60.0,
            fit: BoxFit.cover,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(children: <Widget>[
            Card(
              margin: const EdgeInsets.all(15.0),
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage("${post["img"]}")),
                    Text("${post["nombre"]}" + "  " + "${post["apellido"]}",
                        style: TextStyle(
                            fontSize: 15,
                            height: 5,
                            fontFamily: 'Raleway bold',
                            color: Colors.black)),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15.0),
              elevation: 5,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 400.0,
                      height: 80.0,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Nuevo(id_driver)));
                      },
                      child: Text('Crear Viajes',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Raleway bold')),
                    )
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15.0),
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 400.0,
                      height: 80.0,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MisViajes(id_driver)));
                      },
                      child: Text('Mis Viaje',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Raleway bold')),
                    )
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15.0),
              elevation: 5,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 400.0,
                      height: 80.0,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Notificaciones(id_driver)));
                      },
                      child: Text('Notificaciones',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Raleway bold')),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
