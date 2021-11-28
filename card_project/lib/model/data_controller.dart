import 'dart:async';
import 'dart:convert';
import 'package:card_project/model/publicaciones_controller.dart';
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

Future<http.Response> updateAsientos(String idPost) {
  return http.put(
    Uri.parse(
        'http://jesusloeza.xyz/api/publicaciones/$idPost?cantidad=1&id_cliente=2'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{}),
  );
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
