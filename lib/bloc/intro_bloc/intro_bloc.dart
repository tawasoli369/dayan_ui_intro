import 'package:bloc/bloc.dart';
import 'package:introduction_app_2/events/intro_event/intro_event.dart';
import 'package:introduction_app_2/states/intro_state/intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc(IntroState initialState) : super(initialState);

  @override
  Stream<IntroState> mapEventToState(IntroEvent event) async* {
    var trueFlagEndPage = false;
    if (event is TrueFlagEndPageEvent) {
      trueFlagEndPage = true;
      yield TrueFlagEndPageState();
    } else if (event is FalseFlagEndPageEvent) {
      trueFlagEndPage = false;
      yield FalseFlagEndPageState();
    }
  }
}
