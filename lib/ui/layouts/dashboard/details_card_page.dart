import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/detail_card/detail_card_bloc.dart';
import 'package:poke_app/models/details_card_response.dart';
import 'package:poke_app/ui/widgets/card_info_container.dart';
import 'package:poke_app/ui/widgets/details_card_background.dart';

class DetailsCardPage extends StatefulWidget {
  @override
  State<DetailsCardPage> createState() => _DetailsCardPageState();
}

class _DetailsCardPageState extends State<DetailsCardPage> {
  @override
  Widget build(BuildContext context) {
    DetailsCardResponse algo = DetailsCardResponse();
    final eventBloc = BlocProvider.of<DetailCardBloc>(context);
    return BlocBuilder<DetailCardBloc, DetailCardState>(
      builder: (context, state) {
        return state.hasapoke
            ? Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  tooltip: 'Increment Counter',
                  child: const Icon(Icons.abc_sharp),
                ),
                body: DetailsCardBackground(
                  child: SafeArea(
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              CardTitle(
                                abilitie1: state
                                    .card!.abilities![0].ability!.name
                                    .toString(),
                                abilitie2: state.card!.abilities!.length > 1
                                    ? state.card!.abilities![1].ability!.name
                                        .toString()
                                    : "",
                                baseExperience:
                                    state.card!.baseExperience.toString(),
                                imageurl: state.card!.sprites!.frontDefault!,
                                titulo: state.card!.name!,
                              ),
                              CardInfoContainer(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.70,
                                  child: Column(
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          child: Image.network(
                                            state.card!.sprites!.frontShiny!
                                                .toString(),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.25,
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.high,
                                          )),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 40),
                                        child: Text(
                                          'InfoPokemon',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Fuerza :',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.35,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        state.card!.weight
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Habilidades: ',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        state.card!.stats![1]
                                                            .stat!.name,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        state.card!.stats![2]
                                                            .stat!.name,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        state.card!.stats![3]
                                                            .stat!.name,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        state.card!.stats![4]
                                                            .stat!.name,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        state.card!.stats![5]
                                                            .stat!.name,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Back Pokemon',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.35,
                                                  child: Image.network(
                                                    state.card!.sprites!
                                                        .backDefault!
                                                        .toString(),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.25,
                                                    fit: BoxFit.cover,
                                                    filterQuality:
                                                        FilterQuality.high,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        ButtonsTop(),
                      ],
                    ),
                  ),
                ))
            : Scaffold(
                body: Center(
                  child: Text("cargando..."),
                ),
              );
      },
    );
  }
}

class CardInfoPokemon extends StatelessWidget {
  const CardInfoPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ButtonsTop extends StatelessWidget {
  const ButtonsTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 30),
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'home');
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 50,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 50,
                ))
          ],
        ));
  }
}
