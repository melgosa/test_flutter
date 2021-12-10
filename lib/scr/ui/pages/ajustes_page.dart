import 'package:examen/scr/ui/pages/principal_page.dart';
import 'package:flutter/material.dart';

class AjustesPage extends StatelessWidget {

  static const String routeName = '/notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Examen"),
        ),
        drawer: PrincipalPage(),
        body: Center(
            child: Text("Ajustes....")
        )
    );
  }
}