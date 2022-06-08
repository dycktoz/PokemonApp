import 'package:flutter/material.dart';
import 'package:poke_app/ui/consts/conts_app.dart';

class CardInfoContainer extends StatelessWidget {
  final Widget child;

  const CardInfoContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: _createCard(),
      child: this.child,
    );
  }

  BoxDecoration _createCard() => BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
          ]);
}

class CardTitle extends StatelessWidget {
  final String titulo;

  const CardTitle({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.14,
        ),
        Row(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    titulo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonsInfo(texto: 'holi'),
                        ButtonsInfo(
                          texto: 'hola',
                        )
                      ],
                    )),
              ],
            ),
            Container(
                child: ButtonsInfo(
              texto: 'algo2',
            )),
          ],
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Image.asset(
              ConstsApp.pikachu,
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.height * 0.5,
            ))
      ],
    );
  }
}

class ButtonsInfo extends StatelessWidget {
  final String texto;

  const ButtonsInfo({Key? key, required this.texto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: Colors.grey,
        elevation: 0,
        color: Color.fromARGB(255, 48, 156, 192),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Text(
            texto,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPressed: () {});
  }
}
