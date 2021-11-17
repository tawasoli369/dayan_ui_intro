import 'package:bloc/bloc.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroState(wasEndPage: false));

  void trueEndPageFlag() => emit(IntroState(wasEndPage: true));

  void falseEndPageFlag() => emit(IntroState(wasEndPage: false));
}
