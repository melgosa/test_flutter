import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.online,
    required this.nombre,
    required this.email,
    required this.edad,
    required this.rfc,
    required this.uid,
  });

  bool online;
  String nombre;
  String email;
  String uid;
  int edad;
  String rfc;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    online: json["online"],
    nombre: json["nombre"],
    email: json["email"],
    uid: json["uid"],
    edad: json["edad"],
    rfc: json["rfc"],
  );

  Map<String, dynamic> toJson() => {
    "online": online,
    "nombre": nombre,
    "email": email,
    "uid": uid,
    "edad": edad,
    "rfc": rfc,
  };
}