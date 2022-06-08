import 'package:flutter/material.dart';
import 'package:poke_app/ui/consts/conts_app.dart';

class DetailsCardBackground extends StatelessWidget {
  final Widget child;

  const DetailsCardBackground({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [_Backgroundbox(), this.child],
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
            bottom: 20,
            right: -20,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                ConstsApp.whitePokeball,
                height: size.width * 0.5,
                width: size.width * 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _background() => BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 57, 160, 93),
            Color.fromARGB(255, 255, 255, 255)
          ]));
}
