import 'package:custom_grid_view/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/detail_card/detail_card_bloc.dart';
import 'package:poke_app/models/details_card_response.dart';
import 'package:poke_app/models/pokemon_response.dart';
import 'package:poke_app/services/pokemon_controller.dart';
import 'package:poke_app/ui/widgets/home_title.dart';

class CardPoke extends StatefulWidget {
  @override
  State<CardPoke> createState() => _CardPokeState();
}

class _CardPokeState extends State<CardPoke> {
  List<Result>? results = [];

  PokemonController pokemonController = PokemonController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    llamarAServicio();
  }

  llamarAServicio() async {
    PokemonController pokemoncontroller = PokemonController();
    pokemoncontroller.getPokemonPage(1);

    PokemonResponse pokemonResponse = await pokemoncontroller.getPokemonPage(1);
    results = pokemonResponse.results;
    setState(() {});
  }

  _getIndexes(String txt) {
    List<int> posiciones = [];
    for (var i = 0; i < txt.length; i++) {
      if ("/" == txt[i]) {
        posiciones.add(i);
      }
    }
    return posiciones;
  }

  _getUrlIng(String url) {
    List<int> pos = _getIndexes(url);
    print(url.substring(pos[pos.length - 1], url.length));

    //"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+index+".png");
  }

  _drawWidgets() {
    List<SingleCard> cards = [];

    for (var i = 0; i < results!.length; i++) {
      _getUrlIng(results![i].url);

      SingleCard sc = SingleCard(
        path: results![i].url,
        id: (i + 1).toString(),
        color: Colors.white70,
        text: results![i].name,
      );
      cards.add(sc);
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          HomeTitle(),
          Container(
            height: MediaQuery.of(context).size.height * .75,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Expanded(child: CustomGridView(rows: 2, children: cards)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return results!.isEmpty ? Text("Cargando..") : _drawWidgets();
  }
}

class SingleCard extends StatelessWidget {
  final Color color;
  final String text;
  final String id;
  final String path;

  const SingleCard({
    Key? key,
    required this.color,
    required this.text,
    required this.id,
    required this.path,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        llamarApi(context, path);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 100),
              margin: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    text,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Text(id)
                ],
              ),
            ),
            Stack(
              children: [
                Opacity(
                  opacity: 0.1,
                  child: Container(
                    padding: EdgeInsets.only(top: 80),
                    width: 50,
                    child: CircleAvatar(
                      backgroundColor: color,
                      backgroundImage: AssetImage(
                        'assets/images/pokeball_dark.png',
                      ),
                      radius: 30,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  padding: EdgeInsets.only(top: 80),
                  color: color,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void llamarApi(context, path) {
  print(path);
  final eventBloc = BlocProvider.of<DetailCardBloc>(context);

  DetailsCardResponse detailsCardResponse = DetailsCardResponse();

  eventBloc.add(SetCard(hasapoke: true, card: detailsCardResponse, url: path));
  Navigator.pushReplacementNamed(context, 'detailsCard');
}
