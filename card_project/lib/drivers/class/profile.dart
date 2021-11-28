class Data {
  final int id_drivers;
  final String nombre;
  final String img;
  final String apellido;
  final String email;
  final String status;
  final String celular;
  final String fb;
  final String instagram;
  Data({
    required this.id_drivers,
    required this.nombre,
    required this.img,
    required this.apellido,
    required this.email,
    required this.celular,
    required this.status,
    required this.fb,
    required this.instagram,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id_drivers: json['id_drivers'],
      nombre: json['nombre'],
      img: json['img'],
      apellido: json['apellido'],
      email: json['email'],
      celular: json['celular'],
      status: json['status'],
      fb: json['fb'],
      instagram: json['instagram'],
    );
  }
}
