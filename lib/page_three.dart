
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/NewMessageBloc.dart';
import 'bloc/messagebloc_event.dart';
import 'bloc/messagebloc_state.dart';

class PageThree extends StatefulWidget
{
    @override
    _MyPageThreeState createState() => _MyPageThreeState();
}

class _MyPageThreeState extends State<PageThree> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
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
            BlocProvider.of<NewMessageBloc>(context).add(SendMessage("Three"))
          },
            child: Text('3'),)
        ],
      ),
    );
  }

}