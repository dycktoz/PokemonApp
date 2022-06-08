import 'package:flutter/material.dart';

class CardInfoContainer extends StatelessWidget {
  final Widget child;

  const CardInfoContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
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
  final String baseExperience;
  final String imageurl;
  final String abilitie1;
  final String abilitie2;
  final String titulo;

  const CardTitle(
      {Key? key,
      required this.titulo,
      required this.imageurl,
      required this.baseExperience,
      required this.abilitie1,
      required this.abilitie2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        ButtonsInfo(texto: abilitie1),
                        ButtonsInfo(
                          texto: abilitie2,
                        )
                      ],
                    )),
              ],
            ),
            Container(
                child: ButtonsInfo(
              texto: ('XP: ' + baseExperience),
            )),
          ],
        ),
        Image.network(
          imageurl,
          height: MediaQuery.of(context).size.height * 0.25,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        )
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
        color: Color.fromARGB(50, 57, 160, 93),
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
