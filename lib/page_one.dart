
import 'package:bloc_pattern_sample/message_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloc_provider.dart';

class PageOne extends StatefulWidget
{
  final MessageBloc messageBloc;

  PageOne(this.messageBloc);


  @override
    _MyPageOneState createState() => _MyPageOneState();
}

class _MyPageOneState extends State<PageOne> {

  @override
  void dispose() {
    widget.messageBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider<MessageBloc>(
      bloc: widget.messageBloc,
      child: Container(
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              stream: widget.messageBloc.valueStream,
              initialData: "inital_data on page one",
              builder: (context, snapshot) {

                if(null != snapshot.data)
                  return Text(snapshot.data);

                if(snapshot.hasError)
                  return Text('Error');

                return Text('wait');
              },
            ),
            RaisedButton(onPressed: () => {
              widget.messageBloc.valueSink.add("One")
            },
              child: Text('1'),)
          ],
        ),
      ),
    );
  }

}