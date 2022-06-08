part of 'detail_card_bloc.dart';

@immutable
abstract class DetailCardEvent {}

class SetCard extends DetailCardEvent {
  final String url;
  final bool hasapoke;
  final DetailsCardResponse card;

  SetCard({required this.url, required this.hasapoke, required this.card});
}
