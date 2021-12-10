import 'package:examen/scr/providers/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:examen/scr/providers/auth_provider.dart';
import 'package:examen/scr/ui/widgets/custom_button_azul.dart';
import 'package:examen/scr/ui/widgets/custom_input_widget.dart';
import 'package:examen/scr/ui/widgets/labels_widget.dart';
import 'package:examen/scr/ui/widgets/logo.dart';
import 'package:examen/scr/ui/widgets/snack_message_widget.dart';

class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Registro'),
                _Form(),
                Labels( ruta: 'login', titulo: '¿Ya tienes una cuenta?', subtitulo: 'Ingresa ahora!'),
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text('Términos y condiciones de uso',
                        style: TextStyle(fontWeight: FontWeight.w200)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final rfcCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthProvider>(context);
    final imageProvider = Provider.of<ImageProviderApp>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeHolder: 'Nombre',
            textInputType: TextInputType.name,
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.calendar_today,
            placeHolder: 'Edad',
            textInputType: TextInputType.number,
            textController: ageCtrl,
          ),
          CustomInput(
            icon: Icons.featured_play_list_outlined ,
            placeHolder: 'RFC',
            textInputType: TextInputType.text,
            textController: rfcCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Correo',
            textInputType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          Text('Toca la imagen para tomarte una selfie'),
          SizedBox(height: 10,),
          _profilePicture(imageProvider),
          SizedBox(height: 10,),
          BotonAzul(text: 'Crear cuenta', onPressed: authService.autenticando
              ? () => {}
              : () async {
            FocusScope.of(context).unfocus();

            final registerOk = await authService.register(
                nameCtrl.text.trim() ,
                emailCtrl.text.trim(),
                passCtrl.text.trim(),
              rfcCtrl.text.trim(),
              ageCtrl.text.trim()
            );

            if(registerOk == true){
              Navigator.pushReplacementNamed(context, 'inicio');
            }else{
              showMessageError(context, 'Registro Incorrecto', registerOk);
            }
          }),
          //RaisedButton(onPressed: () {})
        ],
      ),
    );
  }

  Widget _profilePicture(ImageProviderApp imageProvider) {
    return GestureDetector(
      onTap: () {
        imageProvider.getImage(ImageSource.camera);
      },
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
    );
  }
}