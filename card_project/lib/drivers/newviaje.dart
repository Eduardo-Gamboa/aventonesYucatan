// ignore_for_file: unnecessary_new, unused_local_variable
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'class/profile.dart';
import 'dart:convert';
import 'newviaje.dart';
import 'dart:convert';
import 'misviajes.dart';
import 'index.dart';

class Nuevo extends StatefulWidget {
  String id_driver;
  Nuevo(this.id_driver);
  var _id = 0;
  @override
  State<StatefulWidget> createState() {
    return BienvenidaState(this.id_driver);
  }
}

class BienvenidaState extends State<Nuevo> {
  String id_driver;
  BienvenidaState(this.id_driver);
  // var _estados = [];
  var _postJson = [];
  var pueblos = [];
  var automoviles = [];

  // List pueblos = List();
  void estados() async {
    try {
      final consulta = await http.get(Uri.parse(
          'https://api.copomex.com/query/get_municipio_por_estado/Yucat%C3%A1n?token=a0fe63c2-8314-4c4a-8abd-85fef7a9c4e9'));
      // String body = utf8.decode(consulta.bodyBytes);
      final data = jsonDecode(utf8.decode(consulta.bodyBytes));
      final _estados = data['response']['municipios'];
      setState(() {
        pueblos = _estados;
      });
    } catch (err) {}
  }

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
    estados();
  }

  @override
  final _auto = TextEditingController();
  final _de = TextEditingController();
  final _destino = TextEditingController();
  final _precio = TextEditingController();
  final _asientos = TextEditingController();
  final _fecha = TextEditingController();
  final _desc = TextEditingController();
  final _fechas = TextEditingController();
  Widget build(BuildContext context) {
    final post = _postJson[0];
    final id = widget.id_driver;
    var pueblo = pueblos;
    var dropdownValue = '';
    var dropdownValue2 = '';
    var fecha1;

    var lugar = 'Mérida';
    final format = DateFormat("yyyy-MM-dd HH:mm:ss");

    final _claveFormulario = GlobalKey<FormState>();
    return MaterialApp(
      title: 'Aventones',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff343a40),
            title: new Image.asset(
              '/img/aventones.png',
              height: 60.0,
              fit: BoxFit.cover,
            ),
            automaticallyImplyLeading: false,
          ),
          body: Form(
            key: _claveFormulario,
            child: ListView(shrinkWrap: true, children: <Widget>[
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(children: [
                  ListTile(
                    leading: Icon(Icons.airport_shuttle),
                    title: const Text('Nuevo Aventon'),
                  ),
                  Padding(
                      padding: new EdgeInsets.all(16.0),
                      child: DropdownButton<String>(
                        // value: dropdownValue,
                        hint: new Text(
                          'Pueblo de inicio',
                          style: TextStyle(fontFamily: "Gotham"),
                        ),
                        isDense: true,
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          _de.text = newValue!;
                          // dropdownValue = newValue!;
                          // print(dropdownValue2);
                        },
                        style: const TextStyle(color: Colors.deepPurple),
                        items: pueblo.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                  Padding(
                      padding: new EdgeInsets.all(16.0),
                      child: DropdownButton<String>(
                        // value: dropdownValue,
                        hint: new Text(
                          'Pueblo de aventon',
                          style: TextStyle(fontFamily: "Gotham"),
                        ),
                        isDense: true,
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          _destino.text = newValue!;
                        },
                        style: const TextStyle(color: Colors.deepPurple),
                        items: pueblo.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                  Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        String? destino1 = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Escribe el lugar';
                        }
                        return null;
                      },
                      controller: _de,
                      decoration: InputDecoration(
                        contentPadding:
                            new EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
                        hintText: 'Pueblo de inicio',
                        labelText: "Pueblo de inicio",
                      ),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        String? destino2 = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Escribe el precio';
                        }
                        return null;
                      },
                      controller: _destino,
                      decoration: InputDecoration(
                        contentPadding:
                            new EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
                        hintText: 'Destino del aventon',
                        labelText: "Destino del aventon",
                      ),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        String? asientos1 = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Escribe la cantidad';
                        }
                        return null;
                      },
                      controller: _asientos,
                      decoration: InputDecoration(
                        contentPadding:
                            new EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
                        hintText: 'Asientos',
                        labelText: "Asientos",
                      ),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        String? precio1 = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Escribe la cantidad';
                        }
                        return null;
                      },
                      controller: _precio,
                      decoration: InputDecoration(
                        contentPadding:
                            new EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
                        hintText: 'Precio por persona',
                        labelText: "Precio por persona",
                      ),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        String? auto1 = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Escribe el automovil';
                        }
                        return null;
                      },
                      controller: _auto,
                      decoration: InputDecoration(
                        contentPadding:
                            new EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
                        hintText: 'Automóvil',
                        labelText: "Automóvil",
                      ),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        String? descripcion = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Escribe la descripción';
                        }
                        return null;
                      },
                      controller: _desc,
                      decoration: InputDecoration(
                        contentPadding:
                            new EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
                        hintText: 'Descripción',
                        labelText: "Descripción",
                      ),
                    ),
                  ),
                  Padding(
                      padding: new EdgeInsets.all(16.0),
                      child: Column(children: <Widget>[
                        Text('Fecha del viaje'),
                        DateTimeField(
                          controller: _fechas,
                          format: format,
                          onShowPicker: (context, currentValue) async {
                            final date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                            if (date != null) {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    currentValue ?? DateTime.now()),
                              );
                              return DateTimeField.combine(date, time);
                            } else {
                              return currentValue;
                            }
                          },
                        ),
                      ])),
                  Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          disabledColor: Colors.black45,
                          color: Colors.indigo,
                          onPressed: () {
                            setState(() {
                              print(fecha1);
                              _publicar(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      MisViajes(widget.id_driver)));
                            });
                          },
                          child: Text('Crear Publicacion',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Raleway bold')),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          disabledColor: Colors.black45,
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Index(widget.id_driver)));
                            });
                          },
                          child: Text('Regresar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Raleway bold')),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ]),
          )),
    );
  }

  void _publicar(BuildContext context) {
    Future<http.Response> publicar(
      String id_driver,
      String nombreauto,
      String fecha,
      String des,
      String lugar2,
      String lugar1,
      String precio,
      String asientos,
    ) async {
      final response = await http.post(
        Uri.parse('http://jesusloeza.xyz/api/publicaciones'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'nombreauto': nombreauto,
          'fecha': fecha,
          'des': des,
          'lugar1': lugar1,
          'lugar2': lugar2,
          'precio': precio,
          'asientos': asientos,
          'id': id_driver,
        }),
      );
      if (response.statusCode == 200) {
        var success = response.body;
        var dato = success.split("-");
        if (response.body == 'publicado') {
          var id_d = dato[1];
          // Navigator.of(context)
          //               .push(MaterialPageRoute(builder: (context) => Index(id_d)));
        }
      } else {
        throw Exception('Failed to create album');
      }
      return response;
    }

    publicar(widget.id_driver, _auto.text, _fechas.text, _desc.text,
        _destino.text, _de.text, _precio.text, _asientos.text);
  }
}
