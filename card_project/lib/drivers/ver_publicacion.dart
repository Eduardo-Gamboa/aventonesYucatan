import 'dart:async';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'misviajes.dart';
import 'index.dart';

class VerP extends StatefulWidget {
  String id;
  VerP(this.id);
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<VerP> {
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

  void initState() {
    super.initState();
    estados();
    this.getData();
  }

  late List data;
  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("http://jesusloeza.xyz/api/publicacionesmis/" + widget.id),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
      // print(data[0]["location2"]);
    });

    // print(data[0]["conten"]);
    return "Success!";
  }

  @override
  TextEditingController _de = TextEditingController();
  TextEditingController _auto = TextEditingController();
  TextEditingController _destino = TextEditingController();
  TextEditingController _precio = TextEditingController();
  TextEditingController _asientos = TextEditingController();
  TextEditingController _fecha = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _fechas = TextEditingController();
  Widget build(BuildContext context) {
    _de.text = data[0]["location"];
    _destino.text = data[0]["location2"];
    _asientos.text = data[0]["asientos"].toString();
    _auto.text = "";
    _precio.text = data[0]["precio"].toString();
    _fecha.text = data[0]["datatime"];
    _desc.text = data[0]["conten"];
    _fechas.text = data[0]["datatime"];

    var id = '';
    var pueblo = pueblos;
    final _claveFormulario = GlobalKey<FormState>();
    final format = DateFormat("yyyy-MM-dd HH:mm:ss");
    // ignore: unnecessary_new
    return new Scaffold(
        appBar: new AppBar(
            title: new Image.asset(
              '/img/aventones.png',
              height: 60.0,
              fit: BoxFit.cover,
            ),
            backgroundColor: Color(0xff343a40)),
        body: Form(
          key: _claveFormulario,
          child: ListView(shrinkWrap: true, children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(children: [
                ListTile(
                  leading: Icon(Icons.airport_shuttle),
                  title: const Text('Actualizar Aventon'),
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
                      String? de = value;
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
                    keyboardType: TextInputType.text,
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
                      String? _auto = value;
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
                            _update(context);
                            String id_d = data[0]["id_drivers"].toString();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MisViajes(id_d)));
                          });
                        },
                        child: Text('Actualizar Publicacion',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Raleway bold')),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        disabledColor: Colors.black45,
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            _deletes(context);
                            String id_d = data[0]["id_drivers"].toString();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MisViajes(id_d)));
                          });
                        },
                        child: Text('Eliminar Publicacion',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Raleway bold')),
                      ),
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
                            String id_d = data[0]["id_drivers"].toString();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Index(id_d)));
                          });
                        },
                        child: Text('Inicio',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Raleway bold')),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ]),
        ));
  }

  void _deletes(BuildContext context) {
    final id_p = data[0]["id_publications"].toString();
    Future<http.Response> eliminar(String id) async {
      final response = await http.delete(
        Uri.parse('http://jesusloeza.xyz/api/publicacionesmis/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return response;
    }

    eliminar(id_p);
  }

  void _update(BuildContext context) {
    final id_p = data[0]["id_publications"].toString();
    final id_dr = data[0]["id_drivers"].toString();
    Future<http.Response> update(
      String id,
      String id_driver,
      String nombreauto,
      String fecha,
      String des,
      String lugar2,
      String lugar1,
      String precio,
      String asientos,
    ) async {
      final response = await http.put(
        Uri.parse('http://jesusloeza.xyz/api/publicacionesmis/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id_p': id,
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
        print(response.body);
      }
      return response;
    }

    update(id_p, id_dr, _auto.text, _fechas.text, _desc.text, _destino.text,
        _de.text, _precio.text, _asientos.text);
  }
}
