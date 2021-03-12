
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloc_provider.dart';
import 'message_bloc.dart';

class PageTwo extends StatefulWidget
{
  final MessageBloc messageBloc;

  PageTwo(this.messageBloc);

     @override
    _MyPageTwoState createState() => _MyPageTwoState();
}

class _MyPageTwoState extends State<PageTwo> {

  @override
  void dispose() {
    widget.messageBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider<MessageBloc>(
      bloc: widget.messageBloc,
      child: Container(
        color: Colors.blue,
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
              widget.messageBloc.valueSink.add("Two")
            },
              child: Text('2'),)
          ],
        ),
      ),
    );
  }

}