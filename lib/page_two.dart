
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/NewMessageBloc.dart';
import 'bloc/messagebloc_event.dart';
import 'bloc/messagebloc_state.dart';
import 'bloc_provider.dart';
import 'message_bloc.dart';

class PageTwo extends StatefulWidget
{
     @override
    _MyPageTwoState createState() => _MyPageTwoState();
}

class _MyPageTwoState extends State<PageTwo> {

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.blue,
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
            BlocProvider.of<NewMessageBloc>(context).add(SendMessage("Two"))
          },
            child: Text('2'),)
        ],
      ),
    );
  }

}