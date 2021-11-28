import 'dart:async';
import 'dart:convert';
import 'package:card_project/clients/model/publicaciones_controller.dart';
import 'package:http/http.dart' as http;

// delete
Future<http.Response?> deleteStudents(String id) async {
  final http.Response response;
  response = await http.delete(
    Uri.parse('https://api-students-10a.herokuapp.com/students/delete/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> updateAsientos(
    String idPost, String idDriver, String idCliente) async {
  final response = await http.put(
    Uri.parse('http://jesusloeza.xyz/api/publicaciones/$idPost'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id_driver': idDriver,
      'id_cliente': idCliente,
      'cantidad': "1",
      'id_publications': idPost
    }),
  );
  print(response.body);
  return response;
}

Future<http.Response> createStudents(
    String name, String grade, String group_, String email) {
  return http.post(
    Uri.parse('https://api-students-10a.herokuapp.com/students/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'grade': grade,
      'group_': group_,
      'email': email
    }),
  );
}
