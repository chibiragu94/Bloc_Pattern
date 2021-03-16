import 'package:bloc_pattern_sample/bloc/messagebloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'messagebloc_event.dart';

class NewMessageBloc extends Bloc<MessageEvent, MessageState>
{

  NewMessageBloc() : super(InitialState());


  MessageState get initialState => InitialState();


  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    yield InitialState();
    if(event is SendMessage)
      {
        yield RecevieMessage(event.message);
      }
  }

}