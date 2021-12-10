import 'package:examen/scr/providers/auth_provider.dart';
import 'package:examen/scr/ui/widgets/custom_button_azul.dart';
import 'package:examen/scr/ui/widgets/custom_input_widget.dart';
import 'package:examen/scr/ui/widgets/labels_widget.dart';
import 'package:examen/scr/ui/widgets/logo.dart';
import 'package:examen/scr/ui/widgets/snack_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String label_no_tienes_cuenta = '¿No tienes una cuenta? ';
const String label_registrate_ahora = 'Regístrate ahora';
const String label_error_al_iniciar_sesion = 'Error al iniciar de sesión';
const String label_ingresar =  'Ingresar';
const String label_iniciando = 'Iniciando...';
const String label_contrasena = 'Contraseña';
const String label_ingresa_tu_correo = 'Ingresa tu correo';
const String label_b2w_login = 'B2W Login';

const String path_asset_image = 'assets/img/office.png';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Logo(titulo: 'Login'),
                _Form(),
                const Labels( ruta: 'register', titulo: '¿No tienes cuenta?',subtitulo: 'Crea una ahora!',),
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const Text('Términos y condiciones de uso',
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

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
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

          BotonAzul(
              text: 'Ingresar',
              onPressed: authService.autenticando
                  ? () => {}
                  : () async {
                FocusScope.of(context).unfocus();
                final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());

                if(loginOk){
                  Navigator.pushReplacementNamed(context, 'inicio');
                }else{
                  showMessageError(context, 'Login Incorrecto', 'Revise sus credenciales nuevamente');
                }
              }
          ),
          //RaisedButton(onPressed: () {})
        ],
      ),
    );
  }

}
