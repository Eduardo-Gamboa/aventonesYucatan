import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> nuevo(
  String id,
  String nombreauto,
  String fecha,
  String des,
  String lugar2,
  String lugar1,
  String precio,
  String asientos,
) {
  return http.post(
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
      'id': id,
    }),
  );
}
