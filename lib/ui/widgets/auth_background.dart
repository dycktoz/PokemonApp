import 'package:flutter/material.dart';
import 'package:poke_app/ui/consts/conts_app.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [_Backgroundbox(), _HeaderPika(), this.child],
      ),
    );
  }
}

class _HeaderPika extends StatelessWidget {
  const _HeaderPika({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        child: Image.asset(
          ConstsApp.pikachu,
          height: 250,
          width: 250,
        ),
      ),
    );
  }
}

class _Backgroundbox extends StatelessWidget {
  const _Backgroundbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.6,
      decoration: _background(),
      child: Stack(
        children: [
          Positioned(
            top: 135,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                ConstsApp.blackPokeball,
                height: size.width,
                width: size.width,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _background() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 57, 160, 93),
        Color.fromARGB(255, 52, 157, 158)
      ]));
}
