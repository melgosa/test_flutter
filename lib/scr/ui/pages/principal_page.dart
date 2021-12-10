
import 'package:examen/scr/providers/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';


class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final _storage = new FlutterSecureStorage();
  String _nombre = '';
  String _correo = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getData();
    });

  }

  _getData() async{
    _nombre = (await _storage.read(key: 'nombre'))!;
    _correo = (await _storage.read(key: 'correo'))!;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProviderApp>(context);
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
           UserAccountsDrawerHeader(
            accountName: Text(_nombre),
            accountEmail: Text(_correo),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(28.0),
                      child: imageProvider.imageFile != null
                          ? Image.file(
                        imageProvider.imageFile!,
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                      )
                          : Image.asset(
                        'assets/img/avatar_profile.png',
                        scale: 2,
                      ))
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home), title: Text("Inicio"),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'inicio');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings), title: Text("Ajustes"),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'ajustes');
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts), title: Text("Contacto"),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'contacto');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout), title: Text("Cerrar sesión"),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
