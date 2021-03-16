
import 'package:equatable/equatable.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();
}

class SendMessage extends MessageEvent
{
  final String message;


  SendMessage(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

