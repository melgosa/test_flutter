import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:examen/scr/models/login_response.dart';
import 'package:examen/scr/models/usuario.dart';
import 'package:examen/scr/utils/enviroment.dart';

class AuthProvider with ChangeNotifier{

  Usuario? usuario;
  bool _autenticando = false;
  final _storage = new FlutterSecureStorage();
  bool get autenticando => this._autenticando;

  set autenticando(bool valor){
    this._autenticando = valor;
    notifyListeners();
  }

  //Getters del token de forma estatica
  static Future<String?> getToken() async{
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');

    return token;
  }

  static Future deleteToken() async{
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    this._autenticando = true;

    final data = {
      'email': email,
      'password': password
    };

    final url = Uri.http(Enviroment.apiUrl, 'api/login');
    final resp = await http.post(
        url,
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json'
        }
    );

    this._autenticando = false;

    if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

      await this._guardarToken(loginResponse.token);

      return true;
    }else{
      return false;
    }

  }

  Future register(String nombre, String email, String password, String rfc, String edad) async {
    this._autenticando = true;

    if(nombre.isEmpty){
      this._autenticando = false;
      return 'Nombre no puede estar vacío';
    }else if(email.isEmpty){
      this._autenticando = false;
      return 'Email no puede estar vacío';
    }else if(password.isEmpty){
      this._autenticando = false;
      return 'Password no puede estar vacío';
    }else if(rfc.length != 13){
      this._autenticando = false;
      return 'RFC dee ser de 13 digitos';
    }else if(edad.length > 2 || edad.isEmpty){
      this._autenticando = false;
      return 'La edad ingresada no es correcta';
    }else{
      final data = {
        'nombre': nombre,
        'email': email,
        'password': password,
        'rfc': rfc,
        'edad': edad,
      };

      final url = Uri.http(Enviroment.apiUrl, 'api/login/new');
      final resp = await http.post(
          url,
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'}
      );

      this._autenticando = false;

      if(resp.statusCode == 200){
        await _storage.write(key: 'nombre', value: nombre);
        await _storage.write(key: 'correo', value: email);

        final loginResponse = loginResponseFromJson(resp.body);
        this.usuario = loginResponse.usuario;

        await this._guardarToken(loginResponse.token);

        return true;
      }else{
        final respBody = jsonDecode(resp.body);
        return respBody['msg'];
      }
    }
  }

  Future isLoggedIn() async{
    final token = await this._storage.read(key: 'token') ?? '';
    final url = Uri.http(Enviroment.apiUrl, 'api/login/renew');

    final resp = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-token': token
        }
    );

    if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

      await this._guardarToken(loginResponse.token);

      return true;
    }else{
      this._logout();
      return false;
    }
  }

  Future _guardarToken(String token) async{
    return await _storage.write(key: 'token', value: token);
  }

  Future _logout() async{
    return await _storage.delete(key: 'token');
  }
}