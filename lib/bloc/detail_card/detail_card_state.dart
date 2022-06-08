part of 'detail_card_bloc.dart';

@immutable
abstract class DetailCardState {
  final String url;
  final DetailsCardResponse? card;
  final bool hasapoke;

  DetailCardState({required this.url, this.card, required this.hasapoke});
}

class DetailCardInitial extends DetailCardState {
  DetailCardInitial()
      : super(
          url: '',
          card: DetailsCardResponse(),
          hasapoke: false,
        );
}

class DetailsCardSetState extends DetailCardState {
  final String newurl;
  final bool newhasapoke;
  final DetailsCardResponse newcard;
  DetailsCardSetState(this.newhasapoke, this.newcard, this.newurl)
      : super(url: newurl, hasapoke: newhasapoke, card: newcard);
}
