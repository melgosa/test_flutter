import 'dart:convert';

RegistroUsuario registroUsuarioFromJson(String str) => RegistroUsuario.fromJson(json.decode(str));

String registroUsuarioToJson(RegistroUsuario data) => json.encode(data.toJson());

class RegistroUsuario {
  RegistroUsuario({
    required this.birthdate,
    required this.condiciones,
    required this.contactTracing,
    required this.creationDate,
    required this.email,
    required this.hash,
    required this.idCatCompany,
    required this.idCatGender,
    required this.idCatUserType,
    required this.idUsuario,
    required this.maternalSurname,
    required this.name,
    required this.password,
    required this.surname,
    required this.telEmergency,
    required this.telMobile,
    required this.telWork,
    required this.timezoneName,
  });

  DateTime birthdate;
  List<int> condiciones;
  int contactTracing;
  DateTime creationDate;
  String email;
  String hash;
  int idCatCompany;
  int idCatGender;
  int idCatUserType;
  int idUsuario;
  String maternalSurname;
  String name;
  String password;
  String surname;
  String telEmergency;
  String telMobile;
  String telWork;
  String timezoneName;

  factory RegistroUsuario.fromJson(Map<String, dynamic> json) => RegistroUsuario(
    birthdate: DateTime.parse(json["birthdate"]),
    condiciones: List<int>.from(json["condiciones"].map((x) => x)),
    contactTracing: json["contactTracing"],
    creationDate: DateTime.parse(json["creationDate"]),
    email: json["email"],
    hash: json["hash"],
    idCatCompany: json["idCatCompany"],
    idCatGender: json["idCatGender"],
    idCatUserType: json["idCatUserType"],
    idUsuario: json["idUsuario"],
    maternalSurname: json["maternalSurname"],
    name: json["name"],
    password: json["password"],
    surname: json["surname"],
    telEmergency: json["telEmergency"],
    telMobile: json["telMobile"],
    telWork: json["telWork"],
    timezoneName: json["timezoneName"],
  );

  Map<String, dynamic> toJson() => {
    "birthdate": birthdate.toIso8601String(),
    "condiciones": List<dynamic>.from(condiciones.map((x) => x)),
    "contactTracing": contactTracing,
    "creationDate": creationDate.toIso8601String(),
    "email": email,
    "hash": hash,
    "idCatCompany": idCatCompany,
    "idCatGender": idCatGender,
    "idCatUserType": idCatUserType,
    "idUsuario": idUsuario,
    "maternalSurname": maternalSurname,
    "name": name,
    "password": password,
    "surname": surname,
    "telEmergency": telEmergency,
    "telMobile": telMobile,
    "telWork": telWork,
    "timezoneName": timezoneName,
  };
}