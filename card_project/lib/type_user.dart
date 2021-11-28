import 'package:card_project/clients/login.dart';
import 'package:card_project/drivers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class TypeUser extends StatelessWidget {
  // final HomeController _con = HomeController();

  const TypeUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // _con.init(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blueGrey, Colors.black87])),
          child: Column(
            children: [
              _bannerApp(context),
              _textSelecRol("SELECCIONA TU ROL"),
              const SizedBox(height: 30),
              _imageClient(context, '/img/pasajero.png'),
              const SizedBox(height: 20),
              _textTypeUser("Cliente"),
              const SizedBox(height: 30),
              _imageDriver(context, '/img/driver.png'),
              const SizedBox(height: 20),
              _textTypeUser("Conductor")
            ],
          ),
        )));
  }

  Widget _imageClient(BuildContext context, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Login()));
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 50,
        backgroundColor: Colors.grey[800],
      ),
    );
  }

  Widget _imageDriver(BuildContext context, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LoginDrivers()));
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 50,
        backgroundColor: Colors.grey[800],
      ),
    );
  }

  Widget _textTypeUser(String typeUser) {
    return Text(typeUser,
        style: const TextStyle(color: Colors.white, fontSize: 16));
  }

  Widget _textSelecRol(String selectRol) {
    return Text(selectRol,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'OneDay', fontSize: 22));
  }

  Widget _bannerApp(BuildContext context) {
    return ClipPath(
        clipper: DiagonalPathClipperTwo(),
        child: Container(
          color: Color(0xff343a40),
          height: MediaQuery.of(context).size.height * .30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "/img/aventones.png",
                height: 400,
                width: 250,
              ),
              const Text(
                "en Yucatán",
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ));
  }
}
