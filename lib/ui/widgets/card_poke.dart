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
  final _controller = ScrollController();

  PokemonController pokemonController = PokemonController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    llamarAServicio();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {}
      }
    });
  }

  llamarAServicio() async {
    PokemonController pokemoncontroller = PokemonController();
    pokemoncontroller.getPokemonPage();

    PokemonResponse pokemonResponse = await pokemoncontroller.getPokemonPage();
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
    List<SingleCard> cards1 = [];
    List<SingleCard> newcards = cards1 + cards;

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
            height: MediaQuery.of(context).size.height * .725,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Expanded(
                child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              controller: _controller,
              padding: EdgeInsets.symmetric(horizontal: 10),
              crossAxisCount: 2,
              children: cards,
            )),
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
            color: Color.fromARGB(150, 92, 179, 26)),
        child: Stack(
          children: [
            Center(
              child: Expanded(
                child: Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png'),
              ),
            ),
            Center(
              child: Opacity(
                opacity: 0.1,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/pokeball_dark.png',
                  ),
                  radius: 50,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  constraints: BoxConstraints(maxWidth: 150),
                  margin: EdgeInsets.only(left: 10),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            text,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(('ID: ' + id),
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void llamarApi(context, path) {
  final eventBloc = BlocProvider.of<DetailCardBloc>(context);

  DetailsCardResponse detailsCardResponse = DetailsCardResponse();

  eventBloc.add(SetCard(hasapoke: true, card: detailsCardResponse, url: path));
  Navigator.pushNamed(context, 'detailsCard');
}
