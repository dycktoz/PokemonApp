import 'package:flutter/material.dart';
import 'package:poke_app/services/auth_service.dart';
import 'package:poke_app/ui/consts/input_decorations.dart';
import 'package:poke_app/ui/widgets/auth_background.dart';
import 'package:poke_app/ui/widgets/card_container.dart';

class RegisterPage extends StatelessWidget {
  final emailcontroller = TextEditingController(text: '');

  final passcontroller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          CardContainer(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('Register',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 30)),
                SizedBox(
                  height: 30,
                ),
                _LoginForm()
              ],
            ),
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
            child: Text(
              'Iniciar Sesión',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(StadiumBorder()),
                overlayColor:
                    MaterialStateProperty.all(Colors.indigo.withOpacity(0.1))),
          ),
          SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  final emailcontroller = TextEditingController(text: '');

  final passcontroller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                  onChanged: (value) {},
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = new RegExp(pattern);

                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'Ingrese de nuevo el correo';
                  },
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Ash_ketchup@gmail.com',
                      labelText: 'Correo Electronico',
                      prefixIcon: Icons.alternate_email_sharp)),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Nombre obligatorio';
                    return null;
                  },
                  autocorrect: false,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Ash Ketchum',
                      labelText: 'Nombre',
                      prefixIcon: Icons.person)),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  controller: passcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Ingrese su contraseña';
                    return null;
                  },
                  obscureText: true,
                  autocorrect: false,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '*****',
                      labelText: 'Contraseña',
                      prefixIcon: Icons.lock_clock_outlined)),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Color.fromARGB(255, 57, 160, 93),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    child: Text(
                      'ingresar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () => callApi(context))
            ],
          )),
    );
  }

  callApi(BuildContext context) async {
    String name = emailcontroller.value.text;
    String pass = passcontroller.value.text;
    AuthService _authService = AuthService();
    bool isRegister = await _authService.register(name, pass);
    if (isRegister) {
      //registrp completado

      Navigator.pushReplacementNamed(context, 'login');
    } else {
      //regsistro incorrecto
    }
  }
}
