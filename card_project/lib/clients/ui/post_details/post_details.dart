// import 'package:flutter/material.dart';
// import 'package:card_project/theme.dart' as theme;

// // ignore: must_be_immutable
// class PostDetail extends StatefulWidget {
//   late String idPublications;
//   late String idCars;
//   late String datatime;
//   late String location;
//   late String conten;
//   late String location2;
//   late String status;
//   late String precio;
//   late String asientos;
//   late String idDrivers;
//   late String mark;
//   late String placa;
//   late String model;
//   late String nombreconductor;
//   late String apellidoconductor;
//   late String correo;
//   late String fb;
//   late String instagram;
//   late String celular;
//   late String img;

//   PostDetail(
//       this.idPublications,
//       this.idCars,
//       this.datatime,
//       this.location,
//       this.conten,
//       this.location2,
//       this.status,
//       this.precio,
//       this.asientos,
//       this.idDrivers,
//       this.mark,
//       this.placa,
//       this.model,
//       this.nombreconductor,
//       this.apellidoconductor,
//       this.correo,
//       this.fb,
//       this.instagram,
//       this.celular,
//       this.img,
//       {Key? key})
//       : super(key: key);

//   @override
//   State<PostDetail> createState() => _PostDetailState();
// }

// class _PostDetailState extends State<PostDetail> {
//   //Campos de la tabla Publicaciones
//   late String idPublications;
//   late String idCars;
//   late String datatime;
//   late String location;
//   late String conten;
//   late String location2;
//   late String status;
//   late String precio;
//   late String asientos;
//   late String idDrivers;
//   late String mark;
//   late String placa;
//   late String model;
//   late String nombreconductor;
//   late String apellidoconductor;
//   late String correo;
//   late String fb;
//   late String instagram;
//   late String celular;
//   late String img;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Stack(children: <Widget>[
//             Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.all(50),
//               decoration: const BoxDecoration(
//                   border:
//                       Border(bottom: BorderSide(color: Colors.blue, width: 1))),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Hero(
//                     tag: 'planet-icon-${widget.idPublications}',
//                     child: const Image(
//                       image: AssetImage("/img/man.png"),
//                       height: theme.Dimens.planetHeight,
//                       width: theme.Dimens.planetWidth,
//                     ),
//                   ),
//                   Text("ID: " + widget.idPublications,
//                       style: TextStyle(fontSize: 25)),
//                   const SizedBox(height: 20),
//                   Text("La locación es: " + widget.location2,
//                       style: TextStyle(fontSize: 22)),
//                   const SizedBox(height: 20),
//                   Text("Precio: " + widget.precio,
//                       style: TextStyle(fontSize: 22)),
//                   const SizedBox(height: 20),
//                   Text("Asientos: " + widget.asientos,
//                       style: TextStyle(fontSize: 22)),
//                   const SizedBox(height: 20),
//                   Text("Placa de coche: " + widget.placa,
//                       style: TextStyle(fontSize: 22)),
//                   const SizedBox(height: 20),
//                   Text("Contenido: ", style: TextStyle(fontSize: 19)),
//                   Text(widget.conten, style: TextStyle(fontSize: 19)),
//                 ],
//               ),
//             ),
//             // Container(
//             //   // color: Colors.white,
//             //   child: Center(
//             //     child: Hero(
//             //       tag: 'planet-icon-${widget.idPublications}',
//             //       child: const Image(
//             //         image: AssetImage("/img/man.png"),
//             //         height: theme.Dimens.planetHeight,
//             //         width: theme.Dimens.planetWidth,
//             //       ),
//             //     ),
//             //   ),
//             // ),
//           ]),
//           Container(
//             padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//             child: Row(
//               // ignore: prefer_const_literals_to_create_immutables
//               children: <Widget>[
//                 const BackButton(color: Colors.black),
//                 const Text(
//                   "Regresar",
//                   style: TextStyle(fontSize: 18),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
