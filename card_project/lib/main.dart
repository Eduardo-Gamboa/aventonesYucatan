import 'package:card_project/clients/login.dart';
import 'package:card_project/clients/ui/home/posts_list.dart';
import 'package:card_project/type_user.dart';
import 'package:flutter/material.dart';
import 'package:card_project/clients/ui/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: "Aventones",
      routes: {
        "/": (BuildContext context) => const TypeUser(),
      },
    );
  }
}
