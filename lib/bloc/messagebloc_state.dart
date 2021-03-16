import 'package:equatable/equatable.dart';

abstract class MessageState extends Equatable {
  const MessageState();
}

class RecevieMessage extends MessageState
{
  final String message;

  RecevieMessage(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class InitialState extends MessageState
{
  @override
  // TODO: implement props
  List<Object> get props => [];

}