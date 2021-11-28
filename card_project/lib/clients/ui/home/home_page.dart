import 'package:flutter/material.dart';
import 'package:card_project/clients/ui/home/gradient_app_bar.dart';
import 'package:card_project/clients/ui/home/posts_list.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String IdCliente;

  HomePage(this.IdCliente);
  @override
  State<HomePage> createState() => _HomePageState(IdCliente);
}

class _HomePageState extends State<HomePage> {
  String IdCliente;
  _HomePageState(this.IdCliente);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(IdCliente),
    );
  }
}

class HomePageBody extends StatefulWidget {
  String IdCliente;
  HomePageBody(this.IdCliente);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        const GradientAppBar("Aventones"),
        PostList(widget.IdCliente),
      ],
    );
  }
}
