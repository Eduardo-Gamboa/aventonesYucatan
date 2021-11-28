import 'package:flutter/material.dart';
import 'package:card_project/ui/home/gradient_app_bar.dart';
import 'package:card_project/ui/home/posts_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

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
        const PostList(),
      ],
    );
  }
}
