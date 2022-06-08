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
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment Counter',
          child: const Icon(Icons.abc_sharp),
        ),
        body: DetailsCardBackground(
          pokename: 'Pokename',
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ButtonsTop(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  CardInfoContainer(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              BlocBuilder<DetailCardBloc, DetailCardState>(
                                builder: (context, state) {
                                  return Container(
                                    child: Text(
                                        'vzxzzzzzzzzzzzzzzDuis dolor anim aliqua laborum ex veniam nisi mollit dolore.'),
                                  );
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
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
                  Icons.heart_broken,
                  size: 50,
                ))
          ],
        ));
  }
}
