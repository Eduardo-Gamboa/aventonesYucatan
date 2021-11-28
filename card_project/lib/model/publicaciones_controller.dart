import 'dart:io';

import 'package:flutter/cupertino.dart';

class Publicaciones {
  late int idPublications;
  late int idCars;
  late String datatime;
  late String location;
  late String conten;
  late String location2;
  late String status;
  late int precio;
  late int asientos;
  late int idDrivers;
  late String mark;
  late String placa;
  late String model;
  late String nombreconductor;
  late String apellidoconductor;
  late String correo;
  late String fb;
  late String instagram;
  late String celular;
  late String img;

  Publicaciones(
      int idPublications,
      int idCars,
      String datatime,
      String location,
      String conten,
      String location2,
      String status,
      int precio,
      int asientos,
      int idDrivers,
      String mark,
      String placa,
      String model,
      String nombreconductor,
      String apellidoconductor,
      String correo,
      String fb,
      String instagram,
      String celular,
      String img);

  Publicaciones.fromJson(Map<String, dynamic> json) {
    idPublications = json['id_publications'];
    idCars = json['id_cars'];
    datatime = json['datatime'];
    location = json['location'];
    conten = json['conten'];
    location2 = json['location2'];
    status = json['status'];
    precio = json['precio'];
    asientos = json['asientos'];
    idDrivers = json['id_drivers'];
    placa = json['placa'];
    mark = json['mark'];
    model = json['model'];
    nombreconductor = json['nombreconductor'];
    apellidoconductor = json['apellidoconductor'];
    correo = json['correo'];
    fb = json['fb'];
    instagram = json['instagram'];
    celular = json['celular'];
    img = json['img'];
  }
}
