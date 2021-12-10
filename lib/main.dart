import 'package:examen/scr/providers/auth_provider.dart';
import 'package:examen/scr/providers/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:examen/scr/utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) =>  ImageProviderApp()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Examen',
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}