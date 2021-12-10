import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:examen/scr/providers/auth_provider.dart';
import 'package:examen/scr/ui/pages/inicio_page.dart';
import 'package:examen/scr/ui/pages/login_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return const Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async{
    final authService = Provider.of<AuthProvider>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    if(autenticado){
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => InicioPage(),
              transitionDuration: Duration(milliseconds: 0)));
    } else {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoginPage(),
              transitionDuration: Duration(milliseconds: 0)));
    }
  }
}