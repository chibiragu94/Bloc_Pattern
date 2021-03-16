
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/NewMessageBloc.dart';
import 'bloc/messagebloc_event.dart';
import 'bloc/messagebloc_state.dart';
import 'bloc_provider.dart';
import 'message_bloc.dart';

class PageFour extends StatefulWidget
{
     @override
    _MyPageFourState createState() => _MyPageFourState();
}

class _MyPageFourState extends State<PageFour> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
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
            BlocProvider.of<NewMessageBloc>(context).add(SendMessage("Four"))
          },
            child: Text('4'),)
        ],
      ),
    );
  }

}