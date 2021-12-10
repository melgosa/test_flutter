import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:examen/scr/models/registro_usuario_model.dart';
import 'package:http/http.dart' as http;


class NetworkProvider{

  //URL Base
  String _urlBase = 'b2w-api.wokko.io:8443';

  //Login
  String _crearUsuarioPath = '/b2w/save-b2wuser';
  //Registro
  String _loginPath = '/b2w/login';

  /////////////////////CREACION///////////////////////////////////////////

  //TODO: Cambiar el retorno por un String (status 200 - other)
  Future<RegistroUsuario?> registraUsuario(RegistroUsuario usuario) async {
    final url = Uri.https(_urlBase, _crearUsuarioPath);
    final client = http.Client();
    http.Response res;
    try {
      res = await client
          .post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(usuario.toJson())
      ).catchError((e) {
        // SocketException would show up here, potentially after the timeout.
        //print('Tiempo excedido1 $e');
      }).timeout(const Duration(seconds: 10));
      print(json.encode(usuario.toJson()));
      print(res.body);
      return usuario;
    }
    on TimeoutException catch (e) {
      // Display an alert, no internet
      //print('Tiempo excedido2 $e');
      return null;
    }
    on SocketException catch (e){
      //print('Tiempo excedido2 $e');
      return null;
    }
    catch (err) {
      //print(err);
      return null;
    }
  }


}