import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poke_app/models/details_card_response.dart';
import 'package:poke_app/services/pokemon_controller.dart';

part 'detail_card_event.dart';
part 'detail_card_state.dart';

class DetailCardBloc extends Bloc<DetailCardEvent, DetailCardState> {
  DetailCardBloc() : super(DetailCardInitial()) {
    on<SetCard>((event, emit) async {
      DetailsCardResponse dcr = await llamarapi(event.url);
      emit(DetailsCardSetState(event.hasapoke, dcr, event.url));
    });
  }
  Future<DetailsCardResponse> llamarapi(String path) async {
    PokemonController infocard = PokemonController();
    DetailsCardResponse dcr = await infocard.getpokemoninfo(path);
    return dcr;
  }
}
