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
              _imageClient(context, 'assets/img/pasajero.png'),
              const SizedBox(height: 20),
              _textTypeUser("Cliente"),
              const SizedBox(height: 30),
              _imageDriver(context, 'assets/img/driver.png'),
              const SizedBox(height: 20),
              _textTypeUser("Conductor")
            ],
          ),
        )));
  }

  Widget _imageClient(BuildContext context, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'login');
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
        Navigator.pushNamed(context, 'login2');
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
          color: Colors.white,
          height: MediaQuery.of(context).size.height * .30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/img/logo_app.png",
                height: 150,
                width: 100,
              ),
              const Text(
                "Aventones de Calidad",
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
