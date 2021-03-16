
import 'package:bloc_pattern_sample/bloc/NewMessageBloc.dart';
import 'package:bloc_pattern_sample/bloc/messagebloc_event.dart';
import 'package:bloc_pattern_sample/bloc/messagebloc_state.dart';
import 'package:bloc_pattern_sample/message_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageOne extends StatefulWidget
{
  @override
    _MyPageOneState createState() => _MyPageOneState();
}

class _MyPageOneState extends State<PageOne> {

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        BlocBuilder<NewMessageBloc, MessageState>(
          builder: (context, state) {
            if(state is RecevieMessage)
            {
              return Text(state.message);
            }
            return Text("Empty");
          }
        ),
            RaisedButton(onPressed: () => {
              BlocProvider.of<NewMessageBloc>(context).add(SendMessage("One"))
            },
              child: Text('1'),)
          ],
        ),
    );
  }

}