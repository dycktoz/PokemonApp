import 'package:flutter/material.dart';
import 'package:poke_app/ui/widgets/card_poke.dart';
import 'package:poke_app/ui/widgets/home_background.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [Home_background(), HomeBody()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ));
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: CardPoke());
  }
}
