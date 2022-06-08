import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/detail_card/detail_card_bloc.dart';
import 'package:poke_app/ui/consts/conts_app.dart';
import 'package:poke_app/ui/widgets/card_info_container.dart';

class DetailsCardBackground extends StatelessWidget {
  final String pokename;
  final Widget child;

  const DetailsCardBackground(
      {Key? key, required this.child, required this.pokename})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCardBloc, DetailCardState>(
      builder: (context, state) {
        return state.hasapoke
            ? Container(
                color: Colors.grey[300],
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    _Backgroundbox(),
                    CardTitle(
                      titulo: state.card!.name!,
                    ),
                    this.child
                  ],
                ),
              )
            : Text("espere");
      },
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
              opacity: 0.1,
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
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 57, 160, 93),
        Color.fromARGB(255, 52, 157, 158)
      ]));
}
