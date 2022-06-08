import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poke_app/ui/consts/conts_app.dart';

class Home_background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color.fromARGB(252, 249, 249, 249),
        ),
        Positioned(top: -60, left: 185, child: _PokeBall())
      ],
    );
  }
}

class _PokeBall extends StatelessWidget {
  const _PokeBall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 9,
      child: Container(
        child: Opacity(
          opacity: 0.1,
          child: Image.asset(
            ConstsApp.blackPokeball,
            height: 300,
            width: 300,
          ),
        ),
      ),
    );
  }
}
