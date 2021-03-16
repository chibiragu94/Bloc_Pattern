

import 'package:bloc_pattern_sample/bloc/NewMessageBloc.dart';
import 'package:bloc_pattern_sample/bloc/messagebloc_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/messagebloc_state.dart';

class SecondPage extends StatefulWidget {

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  NewMessageBloc newMessageBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    newMessageBloc = BlocProvider.of<NewMessageBloc>(context);
  }

  @override
  void dispose() {
    //newMessageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: Column(
        children: [
          BlocBuilder<NewMessageBloc, MessageState>(
            builder: (context, state) {
              if(state is RecevieMessage )
              {
                return Text(state.message);
              }
              return Text('Empty');
            },
          ),
          RaisedButton(onPressed: ()=>{
            newMessageBloc.add(SendMessage('Five'))
          },
          child: Text('five'),)
        ],
      ),
    );
  }

}