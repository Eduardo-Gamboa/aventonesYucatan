import 'package:card_project/clients/model/data_controller.dart';
import 'package:card_project/clients/ui/home/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:card_settings/card_settings.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class CardPostDetail extends StatefulWidget {
  late String idPublications;
  late String idCars;
  late String datatime;
  late String location;
  late String conten;
  late String location2;
  late String status;
  late String precio;
  late String asientos;
  late String idDrivers;
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
  late String IdCliente;
  final Orientation orientation;
  CardPostDetail(
      this.idPublications,
      this.idCars,
      this.datatime,
      this.location,
      this.conten,
      this.location2,
      this.status,
      this.precio,
      this.asientos,
      this.idDrivers,
      this.mark,
      this.placa,
      this.model,
      this.nombreconductor,
      this.apellidoconductor,
      this.correo,
      this.fb,
      this.instagram,
      this.celular,
      this.img,
      this.orientation,
      this.IdCliente,
      {Key? key})
      : super(key: key);

  @override
  CardPostDetailState createState() => CardPostDetailState();
}

class CardPostDetailState extends State<CardPostDetail> {
  bool loaded = false;

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AutovalidateMode _autoValidateMode = AutovalidateMode.onUserInteraction;

  // keys for fields
  // this is desirable because the fields may change order, in this example
  // when the screen is rotated, and this will preserve what state is
  // attached to what field.
  final GlobalKey<FormState> _idPublicationsKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _idCarsKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _datatimeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _locationKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _contenKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _location2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _statusKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _precioKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _asientosKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _idDriversKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _markKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _placaKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _modelKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nombreconductorKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _apellidoconductorKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _correoKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _fbKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _instagramKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _celularKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _imgKey = GlobalKey<FormState>();

  final FocusNode _idPublicationsNode = FocusNode();
  final FocusNode _idCarsNode = FocusNode();
  final FocusNode _datatimeNode = FocusNode();
  final FocusNode _locationNode = FocusNode();
  final FocusNode _contenNode = FocusNode();
  final FocusNode _location2Node = FocusNode();
  final FocusNode _statusNode = FocusNode();
  final FocusNode _precioNode = FocusNode();
  final FocusNode _asientosNode = FocusNode();
  final FocusNode _idDriversNode = FocusNode();
  final FocusNode _markNode = FocusNode();
  final FocusNode _placaNode = FocusNode();
  final FocusNode _modelNode = FocusNode();
  final FocusNode _nombreconductorNode = FocusNode();
  final FocusNode _apellidoconductorNode = FocusNode();
  final FocusNode _correoNode = FocusNode();
  final FocusNode _fbNode = FocusNode();
  final FocusNode _instagramNode = FocusNode();
  final FocusNode _celularNode = FocusNode();
  final FocusNode _imgNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            children: [
              _buildPortraitLayout(),
              const SizedBox(height: 200),
              // _photoUser(),
              // _appBar()
              _containerBack(),
            ],
          )
        ],
      ),
    );
  }

  void resetPressed() {
    Navigator.pop(context);
  }

  void _actualizarAsientos(BuildContext context) {
    updateAsientos(widget.idPublications, widget.idDrivers, widget.IdCliente);

    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return HomePage("1");
    }));
  }

  Future savePressed() async {
    // final form = _formKey.currentState;

    // if (form.validate()) {
    //   form.save();
    //   showResults(context, _ponyModel);
    // } else {
    //   showErrors(context);
    //   setState(() => _autoValidateMode = AutovalidateMode.onUserInteraction);
    // }
  }

  Container _containerBack() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const BackButton(color: Colors.black),
          const Text(
            "Regresar",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      actions: [
        Scaffold(
          body: CustomScrollView(
            primary: true,
            slivers: <Widget>[
              SliverAppBar(
                title: const Text('Hello World'),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    tooltip: 'Open shopping cart',
                    onPressed: () {
                      // handle the press
                    },
                  ),
                ],
              ),
              // ...rest of body...
            ],
          ),
        )
      ],
    );
  }

  Container _photoUser() {
    return Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(widget.img))));
  }

  CardSettings _buildPortraitLayout() {
    const SizedBox(height: 200);
    return CardSettings.sectioned(
      // showMaterialonIOS: widget.showMaterialonIOS,
      labelWidth: 150,
      contentAlign: TextAlign.center,
      cardless: false,
      children: <CardSettingsSection>[
        CardSettingsSection(
          header: CardSettingsHeader(
            color: const Color(0xFF414141),
            child: _photoUser(),
            label: 'Foto del usuario',
          ),
          children: const <CardSettingsWidget>[],
        ),
        CardSettingsSection(
          header: CardSettingsHeader(
            color: const Color(0xFF32E86C),
            label: 'Información importante del usuario',
          ),
          children: <CardSettingsWidget>[
            _buildCardSettingsText_Name(),
            _buildCardSettingsText_LastName(),
            _text_Correo(),
            _Text_Celular(),
            _Text_Content(5),
          ],
        ),
        CardSettingsSection(
          header: CardSettingsHeader(
            color: const Color(0xFF8E8E8E),
            label: 'Información del VIAJE',
          ),
          instructions: _buildCardSettingsInstructions(),
          children: <CardSettingsWidget>[
            _text_Asientos(),
            _text_Location(),
            _text_Location2(),
            _text_Mark(),
            _text_Model(),
            _text_Placa(),
            _text_Precio(),
          ],
        ),
        CardSettingsSection(
          header: CardSettingsHeader(
            color: const Color(0xFF47B7F7),
            label: 'Acciones',
          ),
          instructions: _instruccionsAccions(),
          children: <CardSettingsWidget>[
            _buttonAceptar(),
            _buttonCancelar(),
          ],
        ),
      ],
    );
  }

  CardSettingsInstructions _buildCardSettingsInstructions() {
    return CardSettingsInstructions(
      text: 'Aquí se encuentra la información del VIAJE, leer con precaución.',
      textColor: Colors.red[800],
    );
  }

  CardSettingsInstructions _instruccionsAccions() {
    return CardSettingsInstructions(
      text: 'Seleccione si desea aceptar el viaje o cancelar.',
      textColor: Colors.indigo[700],
    );
  }

  // CARD DE DATOS DE PUBLICACIONES - POSTS
  // ignore: non_constant_identifier_names
  CardSettingsText _buildCardSettingsText_Name() {
    return CardSettingsText(
      key: _nombreconductorKey,
      label: 'Nombre Conductor',
      hintText: 'something cute...',
      icon: const Icon(Icons.person),
      initialValue: widget.nombreconductor,
      requiredIndicator: const Text('*', style: TextStyle(color: Colors.red)),
      autovalidateMode: _autoValidateMode,
      focusNode: _nombreconductorNode,
      inputAction: TextInputAction.next,
      inputActionNode: _nombreconductorNode,
    );
  }

  CardSettingsText _buildCardSettingsText_LastName() {
    return CardSettingsText(
      key: _apellidoconductorKey,
      icon: const Icon(Icons.person),
      label: 'Apellido',
      hintText: 'Escribe algo bro...',
      initialValue: widget.apellidoconductor,
      autovalidateMode: _autoValidateMode,
      focusNode: _apellidoconductorNode,
      inputAction: TextInputAction.next,
      enabled: false,
    );
  }

  CardSettingsText _text_Location() {
    return CardSettingsText(
      key: _locationKey,
      icon: Icon(Icons.map),
      label: 'Destino',
      hintText: 'Escribe algo bro...',
      initialValue: widget.location,
      autovalidateMode: _autoValidateMode,
      focusNode: _locationNode,
      inputAction: TextInputAction.next,
      enabled: false,
    );
  }

  CardSettingsText _text_Location2() {
    return CardSettingsText(
      key: _location2Key,
      icon: Icon(Icons.map_outlined),
      label: 'Ubicación actual',
      hintText: 'Escribe algo bro...',
      initialValue: widget.location2,
      autovalidateMode: _autoValidateMode,
      focusNode: _location2Node,
      inputAction: TextInputAction.next,
      enabled: false,
    );
  }

// ignore: non_constant_identifier_names
  CardSettingsParagraph _Text_Content(int lines) {
    return CardSettingsParagraph(
      key: _contenKey,
      label: 'Contenido',
      initialValue: widget.conten,
      numberOfLines: lines,
      focusNode: _contenNode,
    );
  }

  CardSettingsText _text_Precio() {
    return CardSettingsText(
      key: _precioKey,
      icon: const Icon(Icons.attach_money),
      label: 'Precio',
      hintText: 'Escribe algo bro...',
      initialValue: widget.precio,
      autovalidateMode: _autoValidateMode,
      focusNode: _precioNode,
      inputAction: TextInputAction.next,
      enabled: false,
    );
  }

  CardSettingsText _text_Asientos() {
    return CardSettingsText(
      key: _asientosKey,
      icon: const Icon(Icons.accessible),
      label: 'Asientos',
      hintText: 'Escribe algo bro...',
      initialValue: widget.asientos,
      autovalidateMode: _autoValidateMode,
      focusNode: _asientosNode,
      inputAction: TextInputAction.next,
      enabled: false,
    );
  }

  CardSettingsText _text_Mark() {
    return CardSettingsText(
      key: _markKey,
      icon: const Icon(Icons.car_rental),
      label: 'Marca',
      hintText: 'Escribe algo bro...',
      initialValue: widget.mark,
      autovalidateMode: _autoValidateMode,
      focusNode: _markNode,
      inputAction: TextInputAction.next,
      enabled: false,
    );
  }

  CardSettingsText _text_Placa() {
    return CardSettingsText(
      key: _placaKey,
      icon: const Icon(Icons.card_membership_rounded),
      label: 'Placa',
      hintText: 'Escribe algo bro...',
      initialValue: widget.placa,
      autovalidateMode: _autoValidateMode,
      focusNode: _placaNode,
      inputAction: TextInputAction.next,
      enabled: false,
    );
  }

  CardSettingsText _text_Model() {
    return CardSettingsText(
      key: _modelKey,
      icon: const Icon(Icons.car_repair),
      label: 'Modelo',
      hintText: 'Escribe algo bro...',
      initialValue: widget.model,
      autovalidateMode: _autoValidateMode,
      focusNode: _modelNode,
      inputAction: TextInputAction.next,
      enabled: false,
    );
  }

  CardSettingsText _text_Correo() {
    return CardSettingsText(
      key: _correoKey,
      icon: const Icon(Icons.email),
      label: 'Correo',
      hintText: 'Escribe algo bro...',
      initialValue: widget.correo,
      autovalidateMode: _autoValidateMode,
      focusNode: _correoNode,
      inputAction: TextInputAction.next,
      enabled: false,
    );
  }

  CardSettingsText _Text_Celular() {
    return CardSettingsText(
      key: _celularKey,
      icon: const Icon(Icons.settings_cell_outlined),
      label: 'Celular',
      hintText: 'Escribe algo bro...',
      initialValue: widget.celular,
      autovalidateMode: _autoValidateMode,
      focusNode: _celularNode,
      inputAction: TextInputAction.next,
      enabled: false,
    );
  }

  //Botones
  CardSettingsButton _buttonCancelar() {
    return CardSettingsButton(
      label: 'CANCELAR',
      isDestructive: true,
      onPressed: resetPressed,
      backgroundColor: Colors.red,
      textColor: Colors.yellow,
    );
  }

  CardSettingsButton _buttonAceptar() {
    return CardSettingsButton(
      label: 'ACEPTAR VIAJE',
      backgroundColor: Colors.green,
      onPressed: () {
        setState(() {
          _actualizarAsientos(context);
        });
      },
      textColor: Colors.white,
    );
  }
}
