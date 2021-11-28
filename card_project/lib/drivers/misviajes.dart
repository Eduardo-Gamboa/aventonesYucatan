import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ver_publicacion.dart';

class MisViajes extends StatefulWidget {
  String id_driver;
  MisViajes(this.id_driver);
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<MisViajes> {
  late List data;
  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("http://jesusloeza.xyz/api/publicacionesmis?id=" +
            widget.id_driver),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[1]["conten"]);

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Color(0xff343a40),
          title: new Image.asset(
            '/img/aventones.png',
            height: 60.0,
            fit: BoxFit.cover,
          )),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
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
                      // print(data[index]["id_publications"]);
                      String id = data[index]["id_publications"].toString();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => VerP(id)));
                    },
                    child: Text("Destino: " + data[index]["location"],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Raleway bold')),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
