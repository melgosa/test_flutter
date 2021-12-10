import 'package:examen/scr/ui/pages/principal_page.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {

  static const String routeName = '/notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Examen"),
        ),
        drawer: PrincipalPage(),
        body: Center(
            child: Text("Inicio...")
        )
    );
  }
}