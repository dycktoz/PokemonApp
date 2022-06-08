import 'package:flutter/material.dart';
import 'package:poke_app/ui/consts/conts_app.dart';

class Details_background extends StatelessWidget {
  final Widget child;

  const Details_background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // backgroundColor: Colors.indigo,
      expandedHeight: 400,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            'hola',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: Container(
          child: Stack(
            children: [
              Positioned(
                  top: -45,
                  left: 220,
                  child: Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      ConstsApp.blackPokeball,
                      height: 250,
                      width: 250,
                    ),
                  ))
            ],
          ),
        ),
        // background: FadeInImage(
        //   placeholder: AssetImage('assets/images/pokeball.png'),
        //   image: AssetImage('assets/images/pokeball.png'),
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}

class _PokeOps extends StatelessWidget {
  const _PokeOps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        child: Container(
          height: 160,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        Icons.back_hand,
                        size: 50,
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        size: 50,
                      )
                    ],
                  )),
              Spacer(),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Pókedex',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
