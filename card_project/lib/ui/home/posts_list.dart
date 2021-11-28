import 'dart:convert';
import 'package:card_project/model/publicaciones_controller.dart';
import 'package:card_project/ui/post_details/card_post_details.dart';
import 'package:flutter/material.dart';
import 'package:card_project/theme.dart' as theme;
import 'package:http/http.dart' as http;

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Publicaciones> data = <Publicaciones>[];
  var photoUser;

  Future<List<Publicaciones>> getData() async {
    var url = Uri.parse('http://jesusloeza.xyz/api/publicaciones');
    var response = await http.get(url, headers: {
      "Accept": "application/json",
    });

    var datos = jsonDecode(response.body);
    late var registros = <Publicaciones>[];
    for (datos in datos) {
      registros.add(Publicaciones.fromJson(datos));
    }
    return registros;
  }

  @override
  void initState() {
    super.initState();
    getData().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Flexible(
      child: Container(
          color: theme.Colors.planetPageBackground,
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    height: 120.0,
                    margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      // ignore: avoid_returning_null_for_void
                      onPressed: () {
                        var idPublications = data[index].idPublications;
                        var idCars = data[index].idCars;
                        var datatime = data[index].datatime;
                        var location = data[index].location;
                        var conten = data[index].conten;
                        var location2 = data[index].location2;
                        var status = data[index].status;
                        var precio = data[index].precio;
                        var asientos = data[index].asientos;
                        var idDrivers = data[index].idDrivers;
                        var mark = data[index].mark;
                        var placa = data[index].placa;
                        var model = data[index].model;
                        var nombreconductor = data[index].nombreconductor;
                        var apellidoconductor = data[index].apellidoconductor;
                        var correo = data[index].correo;
                        var fb = data[index].fb;
                        var instagram = data[index].instagram;
                        var celular = data[index].celular;
                        var img;
                        if (data[index].img == "1637791378_james.jpg") {
                          img =
                              "https://ice-us-wdc-117394.icedrive.io/thumbnail?p=zChgeuPyGgD4VvUfHCRR%2BS2R9JUGRkvchks9bDoId7G5VE7%2BoezqHKJuRLECVuTHlo96F46twEE56Fj4foSOJ2v8orv8XhgN3Q7iQ8xObWabvwPiawHHPu89H1Lyq9JF&w=1280&h=1280&m=cropped";
                        } else {
                          img = data[index].img;
                        }
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                          return CardPostDetail(
                              idPublications.toString(),
                              idCars.toString(),
                              datatime,
                              location,
                              conten,
                              location2,
                              status,
                              precio.toString(),
                              asientos.toString(),
                              idDrivers.toString(),
                              mark,
                              placa,
                              model,
                              nombreconductor,
                              apellidoconductor,
                              correo,
                              fb,
                              instagram,
                              celular,
                              img,
                              orientation);
                        }));
                      },
                      child: Stack(
                        children: <Widget>[
                          //Información de la publicación xdxdxddd
                          Container(
                            margin:
                                const EdgeInsets.only(left: 72.0, right: 24.0),
                            decoration: BoxDecoration(
                              color: theme.Colors.planetCard,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black87,
                                    blurRadius: 10.0,
                                    offset: Offset(0.0, 10.0))
                              ],
                            ),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 16.0, left: 72.0),
                              constraints: const BoxConstraints.expand(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(data[index].nombreconductor,
                                      style: theme.TextStyles.planetTitle),
                                  Text("Destino: " + data[index].location,
                                      style: theme.TextStyles.planetLocation),
                                  Container(
                                      color: Colors.green[500],
                                      width: 24.0,
                                      height: 1.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0)),
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.location_on,
                                          size: 14.0,
                                          color: theme.Colors.planetDistance),
                                      Text(
                                          "Ubicación: " + data[index].location2,
                                          style:
                                              theme.TextStyles.planetDistance),
                                      Container(width: 24.0),
                                      // ignore: prefer_const_constructors
                                      Icon(Icons.price_change,
                                          size: 14.0,
                                          color: theme.Colors.planetDistance),
                                      Text(" " + data[index].precio.toString(),
                                          style:
                                              theme.TextStyles.planetDistance),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          //Foto del card/user
                          Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(_validarPhotoUser(
                                          data[index].img))))),
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  String _validarPhotoUser(String url) {
    if (url == "1637791378_james.jpg") {
      url =
          "https://ice-us-wdc-117394.icedrive.io/thumbnail?p=zChgeuPyGgD4VvUfHCRR%2BS2R9JUGRkvchks9bDoId7G5VE7%2BoezqHKJuRLECVuTHlo96F46twEE56Fj4foSOJ2v8orv8XhgN3Q7iQ8xObWabvwPiawHHPu89H1Lyq9JF&w=1280&h=1280&m=cropped";
    } else {
      url = url;
    }
    return url;
  }

  void showSnackBar(String label, dynamic value) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(label + ' = ' + value.toString()),
      ),
    );
  }
}
