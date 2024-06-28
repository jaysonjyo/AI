import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repostory/API/api_main.dart';
import '../Repostory/Model/FirstModel.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  late FirstModel  firstModel;
  AiApi aiApi=AiApi();
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) async {
      emit(MainBlocLoading());
     try{
       firstModel = await aiApi.getMain();
       emit(MainBlocLoaded());
     }
         catch(a){ emit(MainBlocError());}
      // TODO: implement event handler
    });
  }
}
