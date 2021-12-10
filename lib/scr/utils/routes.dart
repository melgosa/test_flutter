import 'package:examen/scr/ui/pages/ajustes_page.dart';
import 'package:examen/scr/ui/pages/contactanos_page.dart';
import 'package:examen/scr/ui/pages/inicio_page.dart';
import 'package:examen/scr/ui/pages/principal_page.dart';
import 'package:flutter/material.dart';

import 'package:examen/scr/ui/pages/loading_page.dart';
import 'package:examen/scr/ui/pages/login_page.dart';
import 'package:examen/scr/ui/pages/registro_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
  'principal': (_) => PrincipalPage(),
  'inicio': (_) => InicioPage(),
  'ajustes': (_) => AjustesPage(),
  'contacto': (_) => ContactanosPage(),
};